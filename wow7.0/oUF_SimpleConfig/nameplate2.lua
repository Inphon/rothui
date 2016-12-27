
-- oUF_SimpleConfig: nameplate
-- zork, 2016

-----------------------------
-- Variables
-----------------------------

local A, L = ...

-----------------------------
-- NamePlateCallback
-----------------------------

local function NamePlateCallback(...)
print(...)
end
--L.C.NamePlateCallback = NamePlateCallback

-----------------------------
-- NamePlateCVars
-----------------------------

local cvars = {}
cvars["nameplateMinScale"] = 1
cvars["nameplateMaxScale"] = 1
cvars["nameplateGlobalScale"] = 1
cvars["nameplateShowFriendlyNPCs"] = 1
L.C.NamePlateCVars = cvars

-----------------------------
-- NamePlateConfig
-----------------------------

--custom filter for nameplate debuffs
local function CustomFilter(...)
--icons, unit, icon, name, rank, texture, count, dispelType, duration, expiration, caster, isStealable, nameplateShowSelf, spellID, canApply, isBossDebuff, casterIsPlayer, nameplateShowAll
local _, _, _, _, _, _, _, _, _, _, caster, _, _, _, _, _, _, nameplateShowAll = ...
return nameplateShowAll or (caster == "player" or caster == "pet" or caster == "vehicle")
end

L.C.nameplate = {
enabled = true,
size = {180,14},
point = {"CENTER"}, --relative to the nameplate base!
scale = 1*UIParent:GetScale()*L.C.globalscale,--nameplates are not part of uiparent, they must be multiplied by uiparent scale!
--healthbar
healthbar = {
--health and absorb bar cannot be disabled, they match the size of the frame
colorTapping = true,
colorReaction = true,
colorClass = true,
colorHealth = true,
colorThreat = true,
colorThreatInvers = true,
frequentUpdates = true,
name = {
enabled = true,
points = {
{"LEFT",1,13},
{"RIGHT",1,13},
},
size = 14,
align = "RIGHT",
tag = "[difficulty][name]|r",
},
},

CreateFrame('frame'):SetScript('OnUpdate', function(self, elapsed) 
for index = 1, select('#', WorldFrame:GetChildren()) do 
local f = select(index, WorldFrame:GetChildren()) 
if f:GetName() and f:GetName():find('NamePlate%d') then 
f.h = select(1, select(1, f:GetChildren()):GetChildren()) 
if f.h then 
if not f.h.v then 
f.h.v = f.h:CreateFontString(nil, "ARTWORK") 
f.h.v:SetPoint("RIGHT",-1,-14) 
f.h.v:SetFont(STANDARD_TEXT_FONT, 16, 'OUTLINE') 
else 
local _, maxh = f.h:GetMinMaxValues() 
local val = f.h:GetValue() 
f.h.v:SetText(string.format(math.floor((val/maxh)*100)).." %") 
end 
end 
end 
end 
end)

--raidmark
raidmark = {
enabled = true,
size = {18,18},
point = {"CENTER","TOP",0,0},
},
--castbar
castbar = {
enabled = true,
size = {180,18},
point = {"TOP","BOTTOM",0,-5},
name = {
enabled = true,
points = {
{"LEFT",2,0},
{"RIGHT",-2,0},
},
size = 12,
},
icon = {
enabled = true,
size = {18,18},
point = {"RIGHT","LEFT",-6,0},
},
},
--debuffs
debuffs = {
enabled = true,
point = {"BOTTOMLEFT","TOPLEFT",0,15},
num = 5,
cols = 5,
size = 22,
spacing = 5,
initialAnchor = "TOPLEFT",
growthX = "RIGHT",
growthY = "UP",
disableCooldown = false,
filter = "HARMFUL|INCLUDE_NAME_PLATE_ONLY",
CustomFilter = CustomFilter
},
}
