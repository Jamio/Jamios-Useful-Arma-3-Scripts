# Scorch Missile
## Description:
_This bit of script can be entered into the init box of any player._

_This was not made by me, but by Scorch052, and I do not claim this as my own, I just wanted somewhere to store the script version for future reference._

## Usage:

_Copy and Paste the following into the init box of a player who is annoying you as a zeus...

```
_this spawn { _v = "ammo_Missile_Cruise_01" createVehicle [0,0,1000]; _v attachto [_this,[0,0,0]]; _v setVectorDirAndUp [[0,0,1], [-1,0,-1]]; sleep 3; detach _v; [_this, _v] call BIS_fnc_attachToRelative; sleep 5; "HelicopterExploBig" createVehicle (getposATL _v); deleteVehicle _v;};
```


## Additional Notes

