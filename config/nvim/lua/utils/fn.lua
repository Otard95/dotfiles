local M = {}

function M.flow(...)
  local args = {...}
  return function()
    for _, v in ipairs(args) do
      if type(v) == "function" then
        v()
      end
    end
  end
end

return M
