local reg = debug.getregistry()
local GetActiveWeapon = reg.Player.GetActiveWeapon
local GetDTFloat = reg.Entity.GetDTFloat
local GetRunSpeed = reg.Player.GetRunSpeed
local GetWalkSpeed = reg.Player.GetWalkSpeed
local GetCrouchedWalkSpeed = reg.Player.GetCrouchedWalkSpeed
local Crouching = reg.Player.Crouching


function CW_StartCommand(ply, ucmd)
	local wep = GetActiveWeapon(ply)
	
	if IsValid(wep) and wep.CW20Weapon then
        if wep == wep.SwitchWep then
            wep.SwitchWep = nil
        end
		
		local switchTo = wep.SwitchWep
		
		if IsValid(switchTo) then
			ucmd:SelectWeapon(switchTo)
		else
			wep.SwitchWep = nil
		end
	end
end

hook.Add("StartCommand", "CW_StartCommand", CW_StartCommand)
