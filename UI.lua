local module = {}

local function create(instance,properties)
	local object = Instance.new(instance)
	for property, value in pairs(properties) do
		object[property] = value
	end
	return object
end

module.create = create

return module
