local TL, TC, TR = 'TOPLEFT', 'TOP', 'TOPRIGHT'
local ML, MC, MR = 'LEFT', 'CENTER', 'RIGHT'
local BL, BC, BR = 'BOTTOMLEFT', 'BOTTOM', 'BOTTOMRIGHT'
local _G = _G

local addon = _G.CreateFrame('Frame')

addon.buttons = {}

function addon:nothing (...)
end

function addon:hide(f)
	f:Hide()
	f.Show = self.nothing
end

function addon:create_button(n)
	local button = CreateFrame('Frame')
end

function addon:enter_vehicle ()
	MainMenuBarVehicleLeaveButton:ClearAllPoints()
	MainMenuBarVehicleLeaveButton:SetPoint(ML, ActionButton, MR, 3, 0)
end

function addon:exit_vehicle ()
end

function addon:initialize(name)
	if name == 'Visor' then
		--[[local buttons = self.buttons
		for i = 1, 120 do
		buttons[i] = self:create_button(i)
		end]]
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

	ShapeshiftBarFrame:ClearAllPoints()
	ShapeshiftBarFrame:SetPoint(BL, 'MultiBarBottomRightButton1', TL, 0, 5)
	PetActionBarFrame:ClearAllPoints() PetActionBarFrame:SetPoint(BL, 'MultiBarBottomRightButton1', TL, -36, 5)
	MultiCastActionBarFrame:ClearAllPoints()
	MultiCastActionBarFrame:SetPoint(BL, 'MultiBarBottomRightButton1', TL, 0, 5)
	MultiCastActionBarFrame.SetPoint = self.nothing
	MultiBarBottomRight:ClearAllPoints()
	MultiBarBottomRight:SetPoint(BL, 'MultiBarBottomLeftButton1', TL, 0, 5)

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

_G.Visor = addon



