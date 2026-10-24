local ok, jdtls = pcall(require, "jdtls")
if not ok then
  return
end

local root_dir = vim.fs.root(0, {
  "build.gradle",
  "build.gradle.kts",
  "build.xml",
  "gradlew",
  "mvnw",
  "pom.xml",
  "settings.gradle",
  "settings.gradle.kts",
})

if not root_dir then
  return
end

vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

local project_name = vim.fs.basename(root_dir)
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

local cmd = {
  "jdtls",
  "-data",
  workspace_dir,
}

local lombok_jar = vim.fn.stdpath("data") .. "/mason/share/jdtls/lombok.jar"
if vim.fn.filereadable(lombok_jar) == 1 then
  table.insert(cmd, "--jvm-arg=-javaagent:" .. lombok_jar)
end

local config = {
  name = "jdtls",
  cmd = cmd,
  root_dir = root_dir,

  settings = {
    java = {
      implementationsCodeLens = { enabled = false },
      referencesCodeLens = { enabled = false },
      maven = { downloadSources = true },
      signatureHelp = { enabled = true },
      inlayHints = {
        parameterNames = { enabled = "all" },
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk",
          },
          {
            name = "JavaSE-25",
            path = "/usr/lib/jvm/java-25-openjdk",
          },
        },
      },
    },
  },

  handlers = {
    ["language/status"] = function(_, result)
      if result and result.type == "ServiceReady" then
        for _, client in ipairs(vim.lsp.get_clients({ name = "jdtls" })) do
          for bufnr in pairs(client.attached_buffers) do
            vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        end
      end
    end,
  },

  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
