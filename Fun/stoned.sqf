/*
HOW TO USE:

1. Run the following in initPlayerLocal.sqf to set up smokes and variables locally to each player:

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

2. Name something in the mission "smokes" - this becomes the hookah/bong/dealer or whatever.

3. Make sure the execVM points to the correct location i.e scripts or whatever

*/

private ["_playerSmokes"];
_playerSmokes = player getVariable "playerSmokes";

_sound = selectRandom ["smokeweed0","smokeweed1","smokeweed2","smokeweed3","smokeweed4"];

// If drink one drink
if (_playerSmokes == 1) then {
    hint "You feel a slight buzz";
    playSound "inhaleexhale";
    playSound _sound;
PP_chrom1 = ppEffectCreate ["ChromAberration",200];
PP_chrom1 ppEffectEnable true;
PP_chrom1 ppEffectAdjust [0.01,0.01,true];
PP_chrom1 ppEffectCommit 0;
PP_colorC1 = ppEffectCreate ["ColorCorrections",1500];
PP_colorC1 ppEffectEnable true;
PP_colorC1 ppEffectAdjust [0.97,1.1,-0.04,[1.22,1.22,1.24,0.17],[1.03,1,1.03,1.9],[0.33,0.33,0.33,0],[0.2,0,0,0,0,0,-1.33]];
PP_colorC1 ppEffectCommit 0;
PP_colorI1 = ppEffectCreate ["ColorInversion",2500];
PP_colorI1 ppEffectEnable true;
PP_colorI1 ppEffectAdjust [0.07,0.07,0.09];
PP_colorI1 ppEffectCommit 0;
    sleep 120;
    ppEffectDestroy PP_chrom1;
    ppEffectDestroy PP_colorC1;
    ppEffectDestroy PP_colorI1;
};

// If smokes two Smokes
if (_playerSmokes == 2) then {
    hint "You are feeling super chilled";
        playSound "inhaleexhale";
        playSound _sound;
    PP_wetD2 = ppEffectCreate ["WetDistortion",300];
    PP_wetD2 ppEffectEnable true;
    PP_wetD2 ppEffectAdjust [1,0.32,0.32,1,1,1,1,0.05,0.01,0.05,0.01,0.1,0.1,0.2,0.2];
    PP_wetD2 ppEffectCommit 0;
    PP_chrom2 = ppEffectCreate ["ChromAberration",200];
    PP_chrom2 ppEffectEnable true;
    PP_chrom2 ppEffectAdjust [0.01,0.01,true];
    PP_chrom2 ppEffectCommit 0;
    sleep 180;
    ppEffectDestroy PP_wetD2;
    ppEffectDestroy PP_chrom2;

};

// If smokes three Smokes
if (_playerSmokes == 3) then {
    hint "You are beginning to contemplate the origins of the universe";
        playSound "inhaleexhale";
        playSound _sound;
PP_chrom3 = ppEffectCreate ["ChromAberration",200];
PP_chrom3 ppEffectEnable true;
PP_chrom3 ppEffectAdjust [0.09,0.07,true];
PP_chrom3 ppEffectCommit 0;
PP_wetD3 = ppEffectCreate ["WetDistortion",300];
PP_wetD3 ppEffectEnable true;
PP_wetD3 ppEffectAdjust [1,0.2,0.2,0.38,0.16,0.1,0.05,0.02,0.31,0.28,0.17,0,0,0,0];
PP_wetD3 ppEffectCommit 0;
PP_colorC3 = ppEffectCreate ["ColorCorrections",1500];
PP_colorC3 ppEffectEnable true;
PP_colorC3 ppEffectAdjust [0.97,1.06,-0.04,[1.22,1.22,1.24,0.17],[1.03,1,1.03,1.9],[0.33,0.33,0.33,0],[0.2,0,0,0,0,0,-1.33]];
PP_colorC3 ppEffectCommit 0;
PP_colorI3 = ppEffectCreate ["ColorInversion",2500];
PP_colorI3 ppEffectEnable true;
PP_colorI3 ppEffectAdjust [0.05,0.04,0.05];
PP_colorI3 ppEffectCommit 0;
    sleep 300;
        ppEffectDestroy PP_wetD3;
        ppEffectDestroy PP_chrom3;
        ppEffectDestroy PP_colorC3;
        ppEffectDestroy PP_colorI3;
};

// If Smokes more than 3 Smokes
if (_playerSmokes > 3) then {
    hint "You have developed a third eye. You now see the spirit world in its true form - every tree is a lost soul and every speck of dirt is a distant memory. You are now able to feel your ancestors calling to you from the depths of the timeless void. They're speaking vietnamese.";
            playSound "inhaleexhale";
            playSound _sound;
PP_chrom4 = ppEffectCreate ["ChromAberration",200];
PP_chrom4 ppEffectEnable true;
PP_chrom4 ppEffectAdjust [0.4,0.22,true];
PP_chrom4 ppEffectCommit 0;
PP_wetD4 = ppEffectCreate ["WetDistortion",300];
PP_wetD4 ppEffectEnable true;
PP_wetD4 ppEffectAdjust [10,0.01,0.01,2.65,1.8,1.57,0.95,2,1.85,2,1.75,0,0,0,0];
PP_wetD4 ppEffectCommit 0;
PP_colorI4 = ppEffectCreate ["ColorInversion",2500];
PP_colorI4 ppEffectEnable true;
PP_colorI4 ppEffectAdjust [0.65,0.32,0.4];
PP_colorI4 ppEffectCommit 0;
    sleep 600;
    [player, true, 60, true] call ace_medical_fnc_setUnconscious;
            ppEffectDestroy PP_wetD4;
            ppEffectDestroy PP_chrom4;
            ppEffectDestroy PP_colorI4;
    player setVariable ["playerSmokes", 0, true];
};
