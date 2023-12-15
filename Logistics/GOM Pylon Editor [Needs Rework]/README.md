# Grumpy Old Man's Pylon Editor
## Description:
_This code allows for air vehicles to have their pylons changed by the Pilot_

## Usage:

_Add the functions and dialogs folders to the folder named GOM in your mission root_

_Set up a trigger, ANY PLAYER, PRESENT, REPEATABLE, SERVER ONLY_

_Place the following code into the On Activation field of the trigger:_

```
[thislist] remoteexec ["GOM_fnc_addAircraftLoadoutArea",[0,-2] select isDedicated];
```

_Place a container nearby that will act as the Pylon Editor object, and add the following to its init box:_

```
[this,10000] call GOM_fnc_setRepairCargo;
[this,10000] call GOM_fnc_setFuelCargo; 
[this,10000] call GOM_fnc_setAmmoCargo;
```



_The values above can be changed to allow more or less total refueling, repairing and rearming_



## Additional Notes

