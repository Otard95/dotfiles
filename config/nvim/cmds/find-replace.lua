
function do_replace_cycle(find, replace)
    vim.defer_fn(function ()
      vim.ui.input({ prompt = string.format("Find [%s] Replace [%s] ", find, replace), default = 'r' }, function (action)
        if action == 'r' then
          vim.cmd(':s/' .. find .. '/' .. replace .. '/g')
          do_replace_cycle(find, replace)
          return
        end
      end)
    end, 1)
end

function find_replace()
  vim.ui.input({ prompt = "Find " }, function (find)
    if find == nil or find == '' then return end

    vim.ui.input({ prompt = string.format("Find [%s] Replace ", find) }, function (replace)
      if replace == nil then return end

      vim.cmd('/' .. find .. '')
      do_replace_cycle(find, replace)
    end)
  end)
end

vim.keymap.set('n', '<C-f><C-r>', function () find_replace() end, {})
vim.keymap.set('v', '<C-f><C-r>', function () find_replace() end, {})
