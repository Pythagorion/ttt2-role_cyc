/*local base = "pure_skin_element"

DEFINE_BASECLASS(base)

HUDELEMENT.Base = base
HUDELEMENT.icon = Material("vgui/ttt/icon_impostoer_balongus")

-- Code adopted from the beacon logic
if CLIENT then
    local pad = 7

    local const_defaults = {
        basepos = {x = 0, y = 0},
        size = {w = 365, h = 32},
        minsize = {w = 225, h = 32}
    }

    function HUDELEMENT:PreInitialize()
        BaseClass.PreInitialize(self)

        local hud = huds.GetStored("pure_skin")
        if not hud then return end

        hud:ForceElement(self.id)
    end

    function HUDELEMENT:Initialize()
        self.scale = 1.0
        self.basecolor = self:GetHUDBasecolor()
        self.pad = pad

        BaseClass.Initialize(self)
    end
end

-- parameter overwrites
function HUDELEMENT:IsResizable()
    return true, false
end
-- parameter overwrites end

function HUDELEMENT:GetDefaults()
    const_defaults["basepos"] = {
        x = 10 * self.scale,
        y = ScrH() - self.size.h - 146 * self.scale - self.pad - 10 * self.scale
    }

    return const_defaults
end

function HUDELEMENT:PerformLayout()
    self.scale = self:GetHUDScale()
	self.basecolor = self:GetHUDBasecolor()
    self.scale = self:GetHUDScale()

	self.basecolor = self:GetHUDBasecolor()
end

function HUDELEMENT:ShouldDraw()
    local client = player.GetAll()

    return HUDEditor.IsEditing or client:Alive()
end

function HUDELEMENT:DrawComponent(text, bg_color, icon_color)
    local pos = self:GetPos()
    local size = self:GetSize()
    local x, y = pos.x, pos.y
    local w, h = size.w, size.h
    
    self:DrawBg(x, y, w, h, bg_color)
    draw.AdvancedText(text, "PureSkinBar", x + self.iconSize + self.pad, y + h * 0.5, util.GetDefaultColor(bg_color), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, true, self.scale)
    self:DrawLines(x, y, w, h, self.basecolor.a)
    
    local nSize = self.iconSize - 16
    
    draw.FilteredShadowedTexture(x, y - 2 - (nSize - h), nSize, nSize, self.icon, 255, icon_color, self.scale)
end

function HUDELEMENT:Draw()
    local client = player.GetAll()
    local bg_color = self.basecolor
    local flagged_pers = ""

    self:DrawComponent(LANG.GetTranslation("ttt2_impoe_role_sussed_pers", {flagpers = LANG.TryTranslation(flagpers:Nick())}), )
end*/