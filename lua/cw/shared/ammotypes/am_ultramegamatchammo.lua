local att = {}
att.name = "am_ultramegamatchammo"
att.displayName = "Ultra Mega Match grade rounds"
att.displayNameShort = "UMGMatch"

att.statModifiers = {AimSpreadMult = -0.99}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {
		{t = "hello buy Intravenous :)", c = CustomizableWeaponry.textColors.VPOSITIVE},
	}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)