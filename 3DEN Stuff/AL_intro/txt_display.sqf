// by ALIAS
//null = [_title_text,_title_duration,_title_pozition,_text_size,_text_color] execVM "AL_movie\txt_display.sqf";
// EX: // null = ["GIGI",6,"center","1","#FFF000"] execVM "AL_intro\txt_display.sqf";

/*
title_text		- string, text you want to display on the screen
title_duration	- seconds, how long the text stays on screen
title_pozition	- "top_right", "middle_right", "bottom_right", "center", "center_bottom", "center_top", "left_bottom", "left_middle", "left_top"
text_size		- number, text size
_text_color		- RGB hexa code for color
*/

private ["_txt_Layer","_title_text","_title_duration","_title_pozition","_text_size","_text_color","_title_text_i","_txt_al"];

if (loopdone) exitWith {};

_title_text 	= _this select 0;
_title_duration = _this select 1;
_title_pozition = _this select 2;
_text_size 		= _this select 3;
_text_color		= _this select 4;

switch (_title_pozition) do {
	case "top_right": {title_pozition_xx = 'right'; title_pozition_yy = 0;};
	case "middle_right": {title_pozition_xx = 'right'; title_pozition_yy = 0.5;};
	case "bottom_right": {title_pozition_xx = 'right'; title_pozition_yy = 0.9;};
	case "center": {title_pozition_xx = 'center'; title_pozition_yy = 0.5;};
	case "center_bottom": {title_pozition_xx = 'center'; title_pozition_yy = 0.9;};
	case "center_top": {title_pozition_xx = 'center'; title_pozition_yy = 0;};
	case "left_bottom": {title_pozition_xx = 'left'; title_pozition_yy = 0.9;};
	case "left_middle": {title_pozition_xx = 'left'; title_pozition_yy = 0.5;};
	case "left_top": {title_pozition_xx = 'left'; title_pozition_yy = 0;};
};

_txt_Layer = _title_text call BIS_fnc_rscLayer;
_title_text_i = "<t align = '"+ title_pozition_xx + "' size='" + _text_size + "' color='" + _text_color + "'>" + _title_text + "</t>";
[_title_text_i, 0 , title_pozition_yy, _title_duration,/*fadein*/ 2, 0,_txt_Layer] spawn bis_fnc_dynamicText;
