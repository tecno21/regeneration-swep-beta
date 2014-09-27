--variables
material 					= "models/props_lab/Tank_Glass001"
animation 					= ""
lastregen 					= male
regenerated					= true
local new_health 			= 500
--iffo
SWEP.PrintName				= "regeneraton swep (admin)"			
SWEP.Author					= "techno21"
SWEP.Instructions			= "Left mouse to regenerate male. Right mouse to regenerate female"
--spawn menue
SWEP.Spawnable 				= true
SWEP.AdminOnly 				= true
SWEP.Category 				= "Doctor Who"
--primary
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"
--secondary
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
--other info
SWEP.Weight					= 0
SWEP.AutoSwitchTo			= true
SWEP.AutoSwitchFrom			= false
--slot
SWEP.Slot					= 1
SWEP.SlotPos				= 2
--view
SWEP.DrawAmmo				= false
SWEP.DrawCrosshair			= true
--models
--male
male = {}
male[1]="models/player/kleiner.mdl" 
male[2]="models/player/breen.mdl" 
male[3]="models/player/leet.mdl"
male[4]="models/player/gman_high.mdl"
male[5]="models/player/eli.mdl"
male[6]="models/player/odessa.mdl"
male[7]="models/player/magnusson.mdl"
male[8]="models/player/monk.mdl"
male[9]="models/player/barney.mdl"
male[10]="models/player/guerilla.mdl"
male[11]="models/player/group01/male_02.mdl"
--female
female = {}
female[1]="models/player/alyx.mdl"
female[2]="models/player/mossman.mdl"
female[3]="models/player/mossman_arctic.mdl"
female[4]="models/player/group01/female_01.mdl"
female[5]="models/player/group01/female_02.mdl"
female[6]="models/player/group01/female_03.mdl"
female[7]="models/player/group01/female_04.mdl"
female[8]="models/player/group01/female_05.mdl"
female[9]="models/player/group01/female_06.mdl"
--mics.
other = {}
other[1]="models/player/arctic.mdl"
other[2]="models/player/charple.mdl"
other[3]="models/player/combine_soldier.mdl"
other[4]="models/player/combine_soldier_prisonguard.mdl"
other[5]="models/player/combine_super_soldier.mdl"
other[6]="models/player/corpse1.mdl"
other[7]="models/player/gasmask.mdl"
other[8]="models/player/phoenix.mdl"
other[9]="models/player/police.mdl"
other[10]="models/player/riot.mdl"
other[11]="models/player/skeleton.mdl"
other[12]="models/player/soldier_stripped.mdl"
other[13]="models/player/swat.mdl"
other[14]="models/player/urban.mdl"
other[15]="models/player/zombie_classic.mdl"
other[16]="models/player/zombie_fast.mdl"
other[17]="models/player/zombie_soldier.mdl"
function SWEP:Deploy()
    self.Owner:DrawViewModel(false);
end
function SWEP:DrawWorldModel() return false; end
--male
function SWEP:PrimaryAttack()
regenerated = false
self.Owner:SetMaterial( material )
self.Owner:Freeze(true)
self.Owner:ScreenFade( 2, 1, 1, 5 )
timer.Simple(1, function()
self.Owner:ScreenFade( 1, 1, 1, 5 )
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
self.Owner:GodEnable()
regenerated = true
timer.Simple(30, function()
self.Owner:GodDisable()
end)
end)
end)
end
--female
function SWEP:SecondaryAttack()
regenerated = false
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
regenerated = true
timer.Simple(30, function()
self.Owner:GodDisable()
end)
end)
end)
end

--misc.
function SWEP:Reload()
regenerated = false
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
self.Owner:GodEnable()
regenerated = true
timer.Simple(30, function()
self.Owner:GodDisable()
end)
end)
end)
end

