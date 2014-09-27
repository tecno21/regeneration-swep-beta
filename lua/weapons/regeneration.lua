local new_health 			= 100
--iffo
SWEP.PrintName			= "regeneraton swep"			
SWEP.Author				= "techno21"
SWEP.Instructions		= "Left mouse to regenerate male. Right mouse to regenerate female"
--spawn menue
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "Doctor Who(beta)"
--primary
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo		= "none"
--secondary
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"
--other info
SWEP.Weight				= 0
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= false
--slot
SWEP.Slot				= 1
SWEP.SlotPos			= 2
--view
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true
function SWEP:Deploy()
    self.Owner:DrawViewModel(false);
end
function SWEP:DrawWorldModel() return false; end
--male
function SWEP:PrimaryAttack()
self.Owner:SetMaterial( material )
self.Owner:Freeze(true)
self.Owner:ScreenFade(2,1,1,5)
timer.Simple(1, function()
self.Owner:ScreenFade(1,1,1,5)
end)
timer.Simple(3, function()
local model = table.Random(male)
self.Owner:SetModel( model )
self.Owner:SetModelName( model )
timer.Simple(3, function()
self.Owner:Freeze(false)
self.Owner:SetMaterial("")
self.Owner:SetHealth(new_health)
self.Owner:ChatPrint( "your player model is now: " .. model )
lastregen = male
end)
end)
end
--female
function SWEP:SecondaryAttack()
self.Owner:SetMaterial(material)
self.Owner:Freeze(true)
self.Owner:ScreenFade(2,1,1,5)
timer.Simple(1, function()
self.Owner:ScreenFade(1,1,1,5)
end)
timer.Simple(3, function()
local model = table.Random(female)
self.Owner:SetModel( model )
self.Owner:SetModelName( model )
timer.Simple(3, function()
self.Owner:Freeze(false)
self.Owner:SetMaterial("")
self.Owner:SetHealth(new_health)
self.Owner:ChatPrint( "your player model is now: " .. model )
lastregen = female
self.Owner:GodEnable()
end)
end)
end

--misc.
function SWEP:Reload()
self.Owner:SetMaterial(material)
self.Owner:Freeze(true)
self.Owner:ScreenFade(2,1,1,5)
timer.Simple(1, function()
self.Owner:ScreenFade(1,1,1,5)
end)
timer.Simple(3, function()
local model = table.Random(other)
self.Owner:SetModel( model )
self.Owner:SetModelName( model )
timer.Simple(3, function()
self.Owner:Freeze(false)
self.Owner:SetMaterial("")
self.Owner:SetHealth(new_health)
self.Owner:ChatPrint( "your player model is now: " .. model )
lastregen = other
end)
end)
end