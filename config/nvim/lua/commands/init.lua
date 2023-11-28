local buf_only = require 'commands.buffer'
vim.api.nvim_create_user_command('BufOnly', buf_only, {})

local uuid = require 'commands.uuid'
vim.api.nvim_create_user_command('UUID', uuid, { range = true })

local reference = require 'commands.reference'
vim.api.nvim_create_user_command('Reference', reference, { range = true })
