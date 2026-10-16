local utils = require("utils")

return {
  {
    "mfussenegger/nvim-jdtls",
    cond = utils.has_exec("java"),
    ft = "java",
  },
}
