/*
HOW TO USE:

1. Run the following in initPlayerLocal.sqf to set up drinks and variables locally to each player:

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

2. Name something in the mission "drinks1" - this becomes the "bartender" that players can order a beer from

3. Make sure that the execVM points to the correct script location i.e scripts folder then sqf

*/



private ["_playerDrinks"];
_playerDrinks = player getVariable "playerDrinks";

// If drink one drink
if (_playerDrinks == 1) then {
    hint "You feel fine";
    player switchMove "ace_field_rations_drinkStand";
    playSound "drinkgulp";
    sleep 2;
    PP_wetD1 = ppEffectCreate ["WetDistortion",300];
    PP_wetD1 ppEffectEnable true;
    PP_wetD1 ppEffectAdjust [0.1,0.1,0.1,-0.29,-0.24,-0.18,-0.07,0.05,0.01,0.05,0.01,-0.07,-0.05,-0.12,-0.24];
    PP_wetD1 ppEffectCommit 0;
    sleep 120;
    ppEffectDestroy PP_wetD1;
};

// If drink two drinks
if (_playerDrinks == 2) then {
    hint "You start to feel a little hazy";
    player switchMove "ace_field_rations_drinkStand";
    playSound "drinkgulp";
    sleep 2;
PP_chrom2 = ppEffectCreate ["ChromAberration",200];
PP_chrom2 ppEffectEnable true;
PP_chrom2 ppEffectAdjust [-0.04,-0.01,true];
PP_chrom2 ppEffectCommit 0;
PP_wetD2 = ppEffectCreate ["WetDistortion",300];
PP_wetD2 ppEffectEnable true;
PP_wetD2 ppEffectAdjust [1.22,0.005,0,1.68,1.91,1.85,1.97,0.92,0.95,0.99,0.92,0.1,0.1,0.2,0.2];
PP_wetD2 ppEffectCommit 0;
    sleep 180;
    ppEffectDestroy PP_wetD2;
    ppEffectDestroy PP_chrom2;
};

// If drink three drinks
if (_playerDrinks == 3) then {
    hint "You are seeing double of your squadmates";
    player switchMove "ace_field_rations_drinkStand";
    playSound "drinkgulp";
    sleep 1;
PP_chrom3 = ppEffectCreate ["ChromAberration",200];
PP_chrom3 ppEffectEnable true;
PP_chrom3 ppEffectAdjust [0.09,0.02,true];
PP_chrom3 ppEffectCommit 0;
PP_wetD3 = ppEffectCreate ["WetDistortion",300];
PP_wetD3 ppEffectEnable true;
PP_wetD3 ppEffectAdjust [1.22,0.005,0,1.8,1.35,1.23,1.35,1.09,1.09,1.09,1.12,0,0,0,0];
PP_wetD3 ppEffectCommit 0;
    sleep 300;
    ppEffectDestroy PP_wetD3;
    ppEffectDestroy PP_chrom3;
};

// If drinks more than 3 drinks
if (_playerDrinks > 3) then {
    hint "You think it might be a good idea to give your ex a call";
    player switchMove "ace_field_rations_drinkStand";
    playSound "drinkgulp";
    sleep 2;
PP_chrom4 = ppEffectCreate ["ChromAberration",200];
PP_chrom4 ppEffectEnable true;
PP_chrom4 ppEffectAdjust [0.15,0.02,true];
PP_chrom4 ppEffectCommit 0;
PP_wetD4 = ppEffectCreate ["WetDistortion",300];
PP_wetD4 ppEffectEnable true;
PP_wetD4 ppEffectAdjust [1.22,0.005,0,4.51,3.61,2.59,3.78,1.85,1.85,1.84,1.75,0.15,0.15,0.38,0.33];
PP_wetD4 ppEffectCommit 0;
    sleep 600;
    [player, true, 60, true] call ace_medical_fnc_setUnconscious;
    ppEffectDestroy PP_wetD4;
    ppEffectDestroy PP_chrom4;
    player setVariable ["playerDrinks", 0, true];
};
