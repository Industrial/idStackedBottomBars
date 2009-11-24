local TL, TC, TR = 'TOPLEFT', 'TOP', 'TOPRIGHT'
local ML, MC, MR = 'LEFT', 'CENTER', 'RIGHT'
local BL, BC, BR = 'BOTTOMLEFT', 'BOTTOM', 'BOTTOMRIGHT'
local _G = _G

local padding = 6

local addon = _G.CreateFrame('Frame')

addon.buttons = {}

function addon:nothing (...)
end

function addon:hide(f)
	f:Hide()
	f.Show = self.nothing
end

function addon:process_button(i, button, parent_name)
	local button_name = button:GetName()

	button:SetParent(parent_name)
	button:ClearAllPoints()

	if i > 1 then
		local previous_button_name = button_name:match('%a+') .. i - 1
		button:SetPoint(ML, previous_button_name, MR, padding, 0)
	else
		button:SetPoint(BL, parent_name, BL)
	end
end

function addon:set_frame_positions()
	local button

	for i = 1, 12 do
		self:process_button(i, _G['MultiBarRightButton' .. i], 'MultiBarRight')
		self:process_button(i, _G['MultiBarLeftButton' .. i], 'MultiBarLeft')
	end

	local b = MultiBarRightButton1
	local w = b:GetWidth()
	local h = b:GetHeight()
	MultiBarRight:ClearAllPoints()
	MultiBarRight:SetPoint(BL, 'MultiBarBottomRightButton1', TL, 0, 5)
	MultiBarRight:SetWidth(12 * w + 11 * padding)
	MultiBarRight:SetHeight(h)
	MultiBarLeft:ClearAllPoints()
	MultiBarLeft:SetPoint(BC, 'MultiBarRight', TC, 0, 5)
	MultiBarLeft:SetWidth(12 * w + 11 * padding)
	MultiBarLeft:SetHeight(h)

	ShapeshiftBarFrame:ClearAllPoints()
	ShapeshiftBarFrame:SetPoint(BL, 'MultiBarLeftButton1', TL, 0, 5)
	PetActionBarFrame:ClearAllPoints()
	PetActionBarFrame:SetPoint(BL, 'MultiBarLeftButton1', TL, -36, 5)
	MultiCastActionBarFrame:ClearAllPoints()
	MultiCastActionBarFrame:SetPoint(BL, 'MultiBarLeftButton1', TL, 0, 5)
	MultiCastActionBarFrame.SetPoint = self.nothing
	MultiBarBottomRight:ClearAllPoints() MultiBarBottomRight:SetPoint(BL, 'MultiBarBottomLeftButton1', TL, 0, 5)
end

function addon:enter_vehicle ()
	local f = MainMenuBarVehicleLeaveButton

	f:ClearAllPoints()
	f:SetPoint('LEFT', ActionButton12, 'RIGHT', 3, 0)
	f:SetFrameStrata('HIGH')
	f.SetPoint = self.nothing

	self:set_frame_positions()
end

function addon:exit_vehicle ()
	self:set_frame_positions()
end

function addon:initialize(name)
	if name == 'idStackedBottomBars' then
	end
end

function addon:enable()
	local p = _G.UIPARENT_MANAGED_FRAME_POSITIONS
	p.MultiBarLeft = nil
	p.MultiBarRight = nil
	p.MultiBarBottomLeft = nil
	p.MultiBarBottomRight = nil
	p.ShapeShiftBarFrame = nil
	p.MultiCastActionBarFrame = nil
	p.PossessBarFrame = nil

	self:hide(MainMenuBarPageNumber)
	self:hide(ActionBarUpButton)
	self:hide(ActionBarDownButton)
	self:hide(MainMenuXPBarTexture2)
	self:hide(MainMenuXPBarTexture3)
	self:hide(MainMenuBarTexture2)
	self:hide(MainMenuBarTexture3)
	self:hide(MainMenuMaxLevelBar2)
	self:hide(MainMenuMaxLevelBar3)

	ReputationWatchBarTexture2:SetTexture('')
	ReputationWatchBarTexture3:SetTexture('')
	ReputationXPBarTexture2:SetTexture('')
	ReputationXPBarTexture3:SetTexture('')

	MainMenuBar:SetWidth(512)
	MainMenuExpBar:SetWidth(512)
	ReputationWatchBar:SetWidth(512)
	MainMenuBarMaxLevelBar:SetWidth(512)
	ReputationWatchStatusBar:SetWidth(512)

	MainMenuXPBarTexture0:SetPoint('BOTTOM', 'MainMenuExpBar', 'BOTTOM', -128, 2)
	MainMenuXPBarTexture1:SetPoint('BOTTOM', 'MainMenuExpBar', 'BOTTOM', 128, 3)
	MainMenuMaxLevelBar0:SetPoint('BOTTOM', 'MainMenuBarMaxLevelBar', 'TOP', -128, 0)
	MainMenuBarTexture0:SetPoint('BOTTOM', 'MainMenuBarArtFrame', 'BOTTOM', -128, 0)
	MainMenuBarTexture1:SetPoint('BOTTOM', 'MainMenuBarArtFrame', 'BOTTOM', 128, 0)
	MainMenuBarLeftEndCap:SetPoint('BOTTOM', 'MainMenuBarArtFrame', 'BOTTOM', -290, 0)
	MainMenuBarRightEndCap:SetPoint('BOTTOM', 'MainMenuBarArtFrame', 'BOTTOM', 287, 0)

	self:hide(MainMenuBarBackpackButton)
	self:hide(CharacterBag0Slot)
	self:hide(CharacterBag1Slot)
	self:hide(CharacterBag2Slot)
	self:hide(CharacterBag3Slot)
	self:hide(KeyRingButton)
	self:hide(KeyRingButton)

	self:hide(CharacterMicroButton)
	self:hide(SpellbookMicroButton)
	self:hide(TalentMicroButton)
	self:hide(AchievementMicroButton)
	self:hide(QuestLogMicroButton)
	self:hide(SocialsMicroButton)
	self:hide(PVPMicroButton)
	self:hide(LFGMicroButton)
	self:hide(MainMenuMicroButton)
	self:hide(HelpMicroButton)

	self:set_frame_positions()
	hooksecurefunc('UIParent_ManageFramePositions', function() self:set_frame_positions() end)
end

function addon:onevent(event, ...)
	if event == 'ADDON_LOADED' then
		self:initialize(...)
	elseif event == 'PLAYER_LOGIN' then
		self:enable()
	elseif event == 'UNIT_ENTERED_VEHICLE' then
		self:enter_vehicle()
	elseif event == 'UNIT_EXITED_VEHICLE' then
		self:exit_vehicle()
	end
end

addon:SetScript('OnEvent', addon.onevent)
addon:RegisterEvent('ADDON_LOADED')
addon:RegisterEvent('PLAYER_LOGIN')
addon:RegisterEvent('UNIT_ENTERED_VEHICLE')
addon:RegisterEvent('UNIT_EXITED_VEHICLE')

_G.idStackedBottomBars = addon



