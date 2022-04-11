-- Map leader to ¡
vim.g.mapleader = '¡'

-- Sensible defaults
require('settings')

require("plugins").setup()

-- (A folder containing an init.lua file can be required directly, without having to specify the name of the file.)
require("config")


function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    print(diagnostic_message)
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

vim.cmd [[ autocmd CursorHold * lua PrintDiagnostics() ]]

-- Traditional vim command using lua
if vim.fn.has "nvim-0.7" then
  vim.api.nvim_add_user_command('Scrum', "%!MANTA_USER=Joyent_Dev /Users/pedropc/work/engdoc/roadmap/bin/scrum -u pedro -f", {})
end


