/*  
HOW TO USE:

1. Create Trigger - BLUFOR, Present, Repeatable

2. Condition - call{{_x iskindof "landvehicle" && speed _x < 1} count thislist > 0  }

3. On Activation - call{_handle = [(thisList select 0)] execVM "scripts\ServiceGround.sqf";}

4, Check that Activation points to script location correctly i.e scripts folder or mission root. Change countdown to delay the script so it isnt insta.
*/


private ["_veh","_vehType"];
_veh = _this select 0;
_vehType = getText(configFile>>"CfgVehicles">>typeOf _veh>>"DisplayName");

if ((_veh isKindOf "landvehicle") && (driver _veh == player)) exitWith {

	_veh sidechat format ["Servicing %1.", _vehType];
	sleep 3;

	_veh setVehicleAmmo 1;
	_veh sidechat format ["%1 Rearmed.", _vehType];
	sleep 3;

	_veh setDamage 0;
	_veh sidechat format ["%1 Repaired.", _vehType];
	sleep 3;

	_veh setFuel 1;
	_veh sidechat format ["%1 Refueled.", _vehType];
	sleep 2;


	_veh sidechat format ["Service Complete", _vehType];

};
