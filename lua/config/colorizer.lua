local success, colorizer = pcall(require, 'colorizer')

if not succes then
  return
end

colorizer.setup {
  filetypes = {
    '*',
    '!packer',
    '!NvimTree',
    '!mason',
  },
}
