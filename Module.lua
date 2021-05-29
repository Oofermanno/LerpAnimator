local animator = {}
animator.__index = animator


function animator.loadPresets()
	local presets = {}
	setmetatable(presets, animator)
presets.Robust = 0.05
presets.Smooth = 0.01
presets.Fast = 0.1

return presets
end
function animator:getPreset(preset)
	print(self[preset])
	return self[preset]
end

local RS = game:GetService("RunService")
function animator:setSpeed(value)
	self.Speed = value
end
function animator:getSpeed()
	return self.Speed
end
function animator:setPart(part)
	self.Part = part
end
function animator:getPart()
	return self.Part
	
end
function animator:setValue(value)
	self.ChangeTo = value
end
function animator:getValue(value)
	return self.ChangeTo
end
function animator:setWeldStatus(value)
	self.isWeld = value
end
function animator:getWeldStatus()
	return self.IsWeld
end
function animator:transformSize(value)
	self.changeSize = value
end
function animator:isTransformingSize(value)
	return self.changeSize
end
function animator.datamodel(newvalues)
	local properties = {}
	if newvalues ~= nil then
	for i,v in pairs(newvalues) do
		
properties[i] = v
		end
	end
	setmetatable(properties,animator)
return properties
end



function animator.new(prop)
local part = prop.Part
local newValue = prop.ChangeTo
local speed = prop.Speed
local isSize = prop.changeSize
local isWeld = prop.isWeld
for i=0,1,speed do
if isWeld == true then
part.C0 = part.C0:lerp(newValue,i)
else
if typeof(newValue) == "Vector3" then
if isSize == true then
	part.Size = part.Size:lerp(newValue,i)
else
	
	part.Position = part.Position:lerp(newValue,i)
	
	end
else
part[typeof(newValue)] = part[typeof(newValue)]:lerp(newValue,i)
end
RS.Stepped:Wait()
end
end
end

return animator

