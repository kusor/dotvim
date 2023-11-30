local utils = { }

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

function utils.error(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

return utils
