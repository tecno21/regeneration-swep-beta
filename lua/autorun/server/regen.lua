function hurt( ply, a, health )

	if (health < 11) and (ply:IsAdmin() or ply:IsSuperAdmin()) then
		regenerated = false
		ply:SetMaterial( material )
		ply:Freeze(true)
		ply:ScreenFade(2,1,1,5)
		timer.Simple(1, function()
		ply:ScreenFade(1,1,1,5)
		end)
		timer.Simple(3, function()
		local model = table.Random(lastregen)
		ply:SetModel( model )
		ply:SetModelName( model )
		timer.Simple(3, function()
		ply:Freeze(false)
		ply:SetMaterial("")
		ply:SetHealth(500)
		ply:ChatPrint( "your player model is now: " .. model )
		ply:GodEnable()
		regenerated = true
		timer.Simple(30, function()
		ply:GodDisable()
		end)
		end)
		end)
	end
	
end
hook.Add( "GM:PlayerHurt", "playerhurt", hurt )
function Death(ply)
	print("a player died")
	timer.simple(10,function()
	if (regenerated == false) then
		ply:SetMaterial( "" )
		ply:Freeze( false )
		ply:GodDisable()
	end
	end)
end
hook.Add( "GM:PlayerDeath", "death", death )
function spawn(ply)
ply:ChatPrint("regeneration swep atorun test")

end
hook.Add( "GM:PlayerSpawn", "sapwn", spawn)