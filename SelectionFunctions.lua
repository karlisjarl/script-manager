-- variables
local plugin = script:FindFirstAncestorWhichIsA('Plugin')
local selection = game:GetService('Selection')

local module = {}

-- functions
function module.openscript(script)
	plugin:OpenScript(script)
end

function module.set(tbl)
	selection:Set(tbl)
end

function module.get()
	return selection:Get()
end

function module.getobjectswhichisa(class)
	local new = {}
	for _,v in pairs(game:GetDescendants()) do
		if v:IsA(class) then
			new[v] = v
		end
	end
	return new
end

return module
