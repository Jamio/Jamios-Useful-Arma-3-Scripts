# Resupply Box Spawner
## Description:
_This script allows players to spawn pre-defined boxes for resupply._

_The boxes can theoretically contain anything as long as it can fit in an inventory._

## Usage:

_Place an object and name it `boxspawner1` - this will act as the object that players can interact with. I recommend something like a laptop or container._

_Create scripts for the different boxes you wish to spawn using the template below. Drop the scripts in your scripts folder (this can be different, but the action needs to be pointed in the right direction if so):_

```
// medicalBox_spawn.sqf
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
```

_The template above creates an ACE medical box, clears its cargo, and fills it with a bunch of ACE medical items. You can adjust the type of container that is spawned, and add any additional items of varying quantities. Be mindful of how the game treats different items when using the addItem command - there are variants for Items, Magazines, Backpacks and Weapons - pick the appropriate one or the item will not be added._

_Create an EMPTY marker in the location you want the boxes to spawn and give it the variable name `staticboxspawn`_

_Create a script in your scripts folder and name it `boxSpawner.sqf`. In the boxSpawner.sqf file, you will need to add the addActions for each of your boxes you want available. In this example, my medical box filler I made above is named `medicalBox_Spawn.sqf`:_

```
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
```

_initliase the box spawner by placing the following code in the missions init.sqf:_

```
[] execVM "scripts\boxspawner.sqf";
```

_Double check that the addActions point to the correct paths for your created resupply boxes._



## Additional Notes

