/*
HOW TO USE:

1. Place some kind of container or object - name it "boxspawner1"

2. Create separate scripts for the different crates you want to make, for instance the ACE medical box:

if (isServer) then {

_this = _this select 0;
_this = "ACE_medicalSupplyCrate" createVehicle (getMarkerPos "staticboxspawn");

clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;
clearItemCargoGlobal _this;

_this addItemCargoGlobal ["ACE_fieldDressing", 50];
_this addItemCargoGlobal ["ACE_bloodIV", 10];
_this addItemCargoGlobal ["ACE_bloodIV_250", 30];
_this addItemCargoGlobal ["ACE_bloodIV_500", 20];
_this addItemCargoGlobal ["ACE_epinephrine", 25];
_this addItemCargoGlobal ["ACE_morphine", 25];
_this addItemCargoGlobal ["ACE_splint", 20];
_this addItemCargoGlobal ["ACE_tourniquet", 10];

};

3. Create an empty marker nearby, name it "staticboxspawn", this is where the spawned boxes will attempt to be created

4. Check that the addActions in this script link to the correct paths for your personalised boxes and rename the actions


*/


// Add Action for medical crate
boxspawner1 addAction
[
	"<t color='#e0a133'>Medical Supply Crate</t>",
	{
	[[],"scripts\medicalBox_Spawn.sqf"] remoteExec ["execVM",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true", // _target, _this, _originalTarget
	10,
	false,
	"",
	""
];

// Add Action for static weapon crate
boxspawner1 addAction
[
	"<t color='#e0a133'>CSW Supply Crate</t>",
	{
	[[],"scripts\cswBox_Spawn.sqf"] remoteExec ["execVM",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true", // _target, _this, _originalTarget
	10,
	false,
	"",
	""
];

// Add Action for player grenade and mag resupply crate
boxspawner1 addAction
[
	"<t color='#e0a133'>Player Supply Crate</t>",
	{
	[[],"scripts\playerBox_Spawn.sqf"] remoteExec ["execVM",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true", // _target, _this, _originalTarget
	10,
	false,
	"",
	""
];

// Add Action for empty box
boxspawner1 addAction
[
	"<t color='#e0a133'>Empty Supply Box</t>",
	{
	[[],"scripts\emptyBox_Spawn.sqf"] remoteExec ["execVM",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true", // _target, _this, _originalTarget
	10,
	false,
	"",
	""
];
