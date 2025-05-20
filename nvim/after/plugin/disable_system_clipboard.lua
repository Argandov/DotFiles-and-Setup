-- disable Neovim's built-in clipboard provider so it never sets unnamedplus
vim.g.loaded_clipboard = 1          -- skip loading the default provider plugin
vim.g.loaded_clipboard_provider = 1 -- (some versions guard this var instead)

-- At VimEnter, clear any leftover setting
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function() vim.opt.clipboard = "" end,
})
