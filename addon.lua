local TL, TC, TR = 'TOPLEFT', 'TOP', 'TOPRIGHT'
local ML, MC, MR = 'LEFT', 'CENTER', 'RIGHT'
local BL, BC, BR = 'BOTTOMLEFT', 'BOTTOM', 'BOTTOMRIGHT'

local function nothing (...) end

ShapeshiftBarFrame:ClearAllPoints()
ShapeshiftBarFrame:SetPoint(BL, 'MultiBarBottomRightButton1', TL, 0, 5)
PetActionBarFrame:ClearAllPoints() PetActionBarFrame:SetPoint(BL, 'MultiBarBottomRightButton1', TL, -36, 5)
MultiCastActionBarFrame:ClearAllPoints()
MultiCastActionBarFrame:SetPoint(BL, 'MultiBarBottomRightButton1', TL, 0, 5)
MultiCastActionBarFrame.SetPoint = nothing
MultiBarBottomRight:ClearAllPoints()
MultiBarBottomRight:SetPoint(BL, 'MultiBarBottomLeftButton1', TL, 0, 5)

