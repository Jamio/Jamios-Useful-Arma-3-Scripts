# Drinking
## Description:
_This function adds the ability to drink beer, and get drunk. That's pretty much it._

_If you overdo it, you will pass out._

## Usage:

_Add the `drunk.sqf` script to your missions Scripts folder._

_Add the following to the initPlayerLocal.sqf to set up drinks and variables locally to each player._

```
// Initialize the player's private variable for drinks to 0
private ["_playerDrinks"];
_playerDrinks = 0;
player setVariable ["playerDrinks", _playerDrinks, true];

drinks1 addAction ["<t color='#e011f7'>Order A Beer</t>",
{
    private ["_playerDrinks"];
    // Get the current value of the player's drinks variable
    _playerDrinks = player getVariable "playerDrinks";

    // Increment the variable
    _playerDrinks = _playerDrinks + 1;

    // Set the updated value of the variable for the player
    player setVariable ["playerDrinks", _playerDrinks, true];

    // Execute script that checks for drinks and applies PP effects
    ["drunk"] execVM "scripts\drunk.sqf";
},
	[],		// arguments
	1.5,		// priority
	true,		// showWindow
	false,		// hideOnUse
	"",			// shortcut
	"true", 	// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];
```
_Give something in the mission the variable name `drinks1`. This is the virtual bartender that players can interact with to get their drinks._

_Make sure that the execVM in the initPlayerLocal code points to the correct path. By default this is the scripts folder._

_The actual effects can be tweaked, but I wouldnt recommend it unless you know what you're messing around with. The hints for each level of drunkness can be altered too within the script._



## Additional Notes

