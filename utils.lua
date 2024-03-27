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

HOME = os.getenv("HOME")

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

function M.extract_time(text)
	local time_str = ""
	local found_space = false

	-- Iterate from the end of the string
	for i = string.len(text), 1, -1 do
		local char = string.sub(text, i, i)

		-- Check for whitespace or end of string
		if char == " " or i == 1 then
			found_space = true
			break
		end

		-- Append character only if not whitespace and space not found yet
		if char ~= " " and not found_space then
			time_str = char .. time_str -- Prepend character to build the time string
		end
	end

	-- Check if any time was extracted
	if time_str ~= "" then
		return time_str
	else
		return "" -- No time found
	end
end

return M
