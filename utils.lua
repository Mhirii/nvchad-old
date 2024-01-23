local M = {}

--- Plugin Status
M.status = {}

M.extern = function(cmd, opts)
  -- Example:
  --  extern("vim", "vertical")
  --  $ vim;exit # -> quit right after vim exits
  --  so the whole UI is rendered as in terminal.
  --  and killed when the terminal is closed.
  require("nvterm.terminal").send(cmd .. ";exit", opts)
end

HOME = os.getenv "HOME"

function M.cmp_source(name)
  local started = false
  if not package.loaded["cmp"] then
    return
  end
  for _, s in ipairs(require("cmp").core.sources) do
    if s.name == name then
      if s.source:is_available() then
        started = true
      else
        return started and "error" or nil
      end
      if s.status == s.SourceStatus.FETCHING then
        return "pending"
      end
      return true
    end
  end
end

function M.Get_record()
  if package.loaded["recorder"] then
    local ok, recorder = pcall(require, "recorder")
    if ok then
      local status = recorder.recordingStatus()
      if status ~= "" then
        return " " .. status .. " "
      end
      return ""
    else
      return ""
    end
  else
    return ""
  end
end

return M
