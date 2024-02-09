local M = {}

function M.flow(...)
  for _, v in ipairs({...}) do
    if type(v) == "function" then
      v()
    end
  end
end

return M
