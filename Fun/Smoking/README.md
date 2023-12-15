# Smoking
## Description:
_This function adds the ability to smoke, and get stoned. That's pretty much it._

_If you overdo it, you will pass out._

## Usage:

_Add the `stoned.sqf` script to your missions Scripts folder._

_Add the following to the initPlayerLocal.sqf to set up drinks and variables locally to each player._

```
// Initialize the player's private variable for smokes to 0
private ["_playerSmokes"];
_playerSmokes = 0;
player setVariable ["playerSmokes", _playerSmokes, true];

smokes1 addAction ["<t color='#e011f7'>Take A Hit</t>",
{
    private ["_playerSmokes"];
    // Get the current value of the player's drinks variable
    _playerSmokes = player getVariable "playerSmokes";

    // Increment the variable
    _playerSmokes = _playerSmokes + 1;

    // Set the updated value of the variable for the player
    player setVariable ["playerSmokes", _playerSmokes, true];

    // Execute script that checks for drinks and applies PP effects
    ["high"] execVM "scripts\stoned.sqf";
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
_Give something in the mission the variable name `smokes1`. This is the virtual bartender that players can interact with to get their drinks._

_Make sure that the execVM in the initPlayerLocal code points to the correct path. By default this is the scripts folder._

_The actual effects can be tweaked, but I wouldnt recommend it unless you know what you're messing around with. The hints for each level of waviness can be altered too within the script._



## Additional Notes

