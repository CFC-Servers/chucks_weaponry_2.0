CustomizableWeaponry.ITEM_PACKS_TOP_COLOR = Color( 0, 200, 255, 255 )

local noDraw = { CHudAmmo = true, CHudSecondaryAmmo = true, CHudHealth = true, CHudBattery = true }
local noDrawAmmo = { CHudAmmo = true, CHudSecondaryAmmo = true }

local hudEnabled = GetConVar( "cw_customhud" ):GetBool()
cvars.AddChangeCallback( "cw_customhud", function( _, _, new )
    hudEnabled = tobool( new )
end )

local ammoEnabled = GetConVar( "cw_customhud_ammo" ):GetBool()
cvars.AddChangeCallback( "cw_customhud_ammo", function( _, _, new )
    ammoEnabled = tobool( new )
end )

local function CW_HUDShouldDraw( n )
    if not hudEnabled and not ammoEnabled then return end

    local ply = LocalPlayer()
    if not ply:Alive() then return end

    local currentWeapon = ply:GetActiveWeapon()
    local wepTable = currentWeapon:GetTable()
    if not wepTable then return end
    if not wepTable.CW20Weapon then return end

    if ammoEnabled and noDrawAmmo[n] then
        return false
    end

    if hudEnabled and noDraw[n] then
        return false
    end
end

hook.Add( "HUDShouldDraw", "CW_HUDShouldDraw", CW_HUDShouldDraw )
