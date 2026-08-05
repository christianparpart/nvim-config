-- Neovim >= 0.11 owns `background`: it queries the terminal with OSC 11 at startup
-- (see :help 'ttyfast') and re-queries when the terminal announces a theme change
-- via DEC mode 2031. We only ever *read* it and pick a matching onedarkpro variant.
--
-- Use the fully qualified variant names: bare `onedark` is ambiguous as soon as any
-- other colorscheme plugin ships a `colors/onedark.*` of its own, and which one wins
-- then depends on the runtimepath order lazy.nvim happens to produce that startup.
local M = {}

function M.name()
  return vim.o.background == "light" and "onelight" or "onedark_vivid"
end

function M.apply()
  local theme = M.name()
  if vim.g.colors_name ~= theme then
    vim.cmd.colorscheme(theme)
  end
end

function M.setup()
  vim.api.nvim_create_autocmd("OptionSet", {
    group = vim.api.nvim_create_augroup("theme_follow_background", { clear = true }),
    pattern = "background",
    callback = M.apply,
  })
end

return M
