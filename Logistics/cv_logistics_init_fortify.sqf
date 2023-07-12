/*
HOW TO USE:

1. Drop script into scripts folder

2. Create and name constructionCrate1 and refillCrate1 in mission - CC1 is the moveable container for building around, RC1 is the static refill point

3. Check cvo_maxBudget and refillBudget are suitable for mission. Check distance from CC1 is ok.  

4. Alter each preset and array for each preset to your liking.

5. Compile script in init.sqf with: [compileScript ["cvo\logistics\cvo_logistics_init_fortify.sqf"]] call CBA_fnc_directCall;

6. Check that script location matches - by default this goes in a folder called cvo/logistics

*/


// ################################################
// Define:
cvo_engineerVehicleClass = "constructionCrate1";
cvo_refillObject = "refillCrate1";
cvo_maxBudget = 1000;
cvo_refillBudget = 100;


// Default Fortify Budget, Objects and Prices

if (isServer) then {
[west, cvo_maxBudget, [
				["Land_vn_b_trench_bunker_05_01", 10],
                ["Land_vn_bunker_small_01", 30],
                ["Land_vn_sandbagbarricade_01_half_f", 10],
                ["Land_vn_sandbagbarricade_01_f", 10],
                ["Land_vn_sandbagbarricade_01_hole_f", 10],
                ["Land_vn_b_trench_stair_02", 20],
                ["Land_vn_b_trench_stair_01", 20],
                ["Land_vn_b_tower_01", 30],
                ["Land_vn_b_trench_05_02", 10],
                ["Land_vn_bagfence_01_long_green_f", 5],
                ["Land_vn_bagfence_01_round_green_f", 5],
                ["Land_vn_bagfence_01_short_green_f", 5],
                ["Land_vn_czechhedgehog_01_f", 5]
]] call ace_fortify_fnc_registerObjects;
};



// ################################################
// 2. Additional Conditions to use Fortify


[{
	params ["_unit", "_object", "_cost"];

	private _condition2 = (_unit) distance constructionCrate1 <150; 	// Checks if player is near to the Construction Crate

	private _case2 = if (_condition2) then {true}
		else {"You are too far away from supplies" remoteExec ["hint", _unit];false};

	_case2;
}] call ace_fortify_fnc_addDeployHandler;


// ################################################
// 3. Replenish building supplies when fortify_vehicle is close enough to cvo_refillObject, current maximum loaded: cvo_maxBudget

private _code = {
	[{
		[
			"Replenishing Fortify Budget",	// Title of progressBar
			10,								// Duration of progressBar in secounds
			{true},							// Condition, will check every frame
			{
				_currentBudget = [west] call ace_fortify_fnc_getBudget;
				if (_currentBudget > (cvo_maxBudget - cvo_refillBudget)) then {							// if current Fortify Budget is more then MAX - refillQuantity, top off until max.
					[west,(cvo_maxBudget - _currentBudget), true] call ace_fortify_fnc_updateBudget;
				} else { [west, cvo_refillBudget, true] call ace_fortify_fnc_updateBudget; }			// if current Fortify Budget is less then MAX - RefillQuantity, add refillQuantity.
			}								// codeblock to be executed on completion
		] call CBA_fnc_progressBar;			// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;			// <- this will delay the execution by 1 Frame.
}; 											// This is the code you want the interaction to execute.


// Here we create the action which we later attach to something
_cvo_Fort_refillVehicle = [
	"CVO_Fort_refillVehicle",				// Action Name
	"Replenish Building Supplies",		// Name for the ACE Interaction Menu
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\refuel_ca.paa",
	_code,									// the code you're executing
	{
	(110 > constructionCrate1 distance refillCrate1) && ([west] call ace_fortify_fnc_getBudget < cvo_maxBudget);
	}										// Condition for action to be shown:
] call ace_interact_menu_fnc_createAction;

// Here we define where we want this action that we created to be attached to
[
	refillCrate1,						// Object the action should be assigned to
	0,										// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions"],					// Parent path of the new action <Array>
	_cvo_Fort_refillVehicle							// The Ace_action to be attached
] call ace_interact_menu_fnc_addActionToObject;		// Alternative: ace_interact_menu_fnc_addActionToObject




// ################################################
// 4. Change Presets to have several short lists instead of 1 long.

// Initial Node

_action = ["CVO_Fort_Node","Change Fortify Blueprints","\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",{""},{true}] call ace_interact_menu_fnc_createAction;
[constructionCrate1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


// -> HBarrier Preset
private _code_p1 = {
	[{
		[
			"Switching Fortify Blueprints",	// Title of progressBar
			3,								// Duration of progressBar in secounds
			{true},							// Condition, will check every frame
			{
				_currentBudget = [west] call ace_fortify_fnc_getBudget;

				[west, _currentBudget, [
				["Land_vn_b_trench_bunker_05_01", 10],
                ["Land_vn_bunker_small_01", 30],
                ["Land_vn_sandbagbarricade_01_half_f", 10],
                ["Land_vn_sandbagbarricade_01_f", 10],
                ["Land_vn_sandbagbarricade_01_hole_f", 10],
                ["Land_vn_b_trench_stair_02", 20],
                ["Land_vn_b_trench_stair_01", 20],
                ["Land_vn_b_tower_01", 30],
                ["Land_vn_b_trench_05_02", 10],
                ["Land_vn_bagfence_01_long_green_f", 5],
                ["Land_vn_bagfence_01_round_green_f", 5],
                ["Land_vn_bagfence_01_short_green_f", 5],
                ["Land_vn_czechhedgehog_01_f", 5]
				]] remoteExec  ["ace_fortify_fnc_registerObjects", 2];
			}								// codeblock to be executed on completion
		] call CBA_fnc_progressBar;			// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;			// <- this will delay the execution by 1 Frame.
}; 											// This is the code you want the interaction to execute.


_cvo_Fort_preset1 = [
	"CVO_Fort_preset1",						// Action Name
	"Get Light Defence Blueprints",				// Name for the ACE Interaction Menu
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",										// Statement - i have no fucking clue what that is supposed to mean
	_code_p1,									// the code you're executing
	{true}										// Condition for action to be shown:
] call ace_interact_menu_fnc_createAction;


// -> Sandbag Preset
private _code_p2 = {
	[{
		[
			"Switching Fortify Blueprints",	// Title of progressBar
			3,								// Duration of progressBar in secounds
			{true},							// Condition, will check every frame
			{
				_currentBudget = [west] call ace_fortify_fnc_getBudget;

				[west, _currentBudget, [
					["Land_vn_b_trench_20_02", 20],
                    ["Land_vn_b_trench_20_01", 20],
                    ["Land_vn_b_trench_45_02", 20],
                    ["Land_vn_b_trench_45_01", 20],
                    ["Land_vn_b_trench_05_03", 20],
                    ["Land_vn_b_trench_90_01", 20],
                    ["Land_vn_b_trench_90_02", 20],
                    ["Land_vn_b_trench_corner_01", 20],
                    ["Land_vn_b_trench_cross_02", 20],
                    ["Land_vn_b_trench_cross_01", 20],
                    ["Land_vn_b_trench_tee_01", 20],
                    ["Land_vn_b_trench_revetment_05_01", 20],
                    ["Land_vn_b_trench_revetment_tall_03", 20],
                    ["Land_vn_b_trench_revetment_90_01", 20],
                    ["Land_vn_b_trench_revetment_tall_09", 20]
				]] remoteExec ["ace_fortify_fnc_registerObjects", 2];
			}								// codeblock to be executed on completion
		] call CBA_fnc_progressBar;			// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;			// <- this will delay the execution by 1 Frame.
}; 											// This is the code you want the interaction to execute.


// Here we create the action which we later attach to something
_cvo_Fort_preset2 = [
	"CVO_Fort_preset2",						// Action Name
	"Get Trench Blueprints",				// Name for the ACE Interaction Menu
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",										// Statement - i have no fucking clue what that is supposed to mean
	_code_p2,									// the code you're executing
	{true}										// Condition for action to be shown:
] call ace_interact_menu_fnc_createAction;


// -> Concrete n Shit Preset
private _code_p3 = {
	[{
		[
			"Switching Fortify Blueprints",	// Title of progressBar
			3,								// Duration of progressBar in secounds
			{true},							// Condition, will check every frame
			{
				_currentBudget = [west] call ace_fortify_fnc_getBudget;

				[west, _currentBudget, [
					["Land_vn_b_foxhole_01", 20],
                    ["Land_vn_b_trench_bunker_03_01", 60],
                    ["Land_vn_b_gunpit_01", 50],
                    ["Land_vn_b_mortarpit_01", 20],
                    ["Land_vn_pillboxbunker_01_rectangle_f", 120],
                    ["Land_vn_b_trench_firing_01", 60],
                    ["Land_vn_b_trench_firing_05", 40],
                    ["Land_vn_b_trench_firing_02", 60],
                    ["Land_vn_bunker_big_02", 60]
				]] remoteExec  ["ace_fortify_fnc_registerObjects", 2];
			}								// codeblock to be executed on completion
		] call CBA_fnc_progressBar;			// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;			// <- this will delay the execution by 1 Frame.
}; 											// This is the code you want the interaction to execute.


// Here we create the action which we later attach to something
_cvo_Fort_preset3 = [
	"CVO_Fort_preset3",						// Action Name
	"Get Bunkers and Fortified Position Blueprints",	// Name for the ACE Interaction Menu
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",										// Statement - i have no fucking clue what that is supposed to mean
	_code_p3,									// the code you're executing
	{true}										// Condition for action to be shown:
] call ace_interact_menu_fnc_createAction;




// Here we define where we want this action that we created to be attached to
{[
	constructionCrate1,						// Object the action should be assigned to
	0,												// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions","CVO_Fort_Node"],			// Parent path of the new action <Array>
	_x												// The Ace_action to be attached
] call ace_interact_menu_fnc_addActionToObject;		// Alternative: ace_interact_menu_fnc_addActionToObject
} forEach [_cvo_Fort_preset1,_cvo_Fort_preset2,_cvo_Fort_preset3];
