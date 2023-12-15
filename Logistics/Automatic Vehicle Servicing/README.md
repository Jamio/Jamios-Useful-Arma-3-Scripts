# Automatic Vehicle Servicing
## Description:
_This code allows vehicles to be automatically repaired, rearmed and refueled at specific areas marked with triggers_

_The function is available for both air and ground vehicles._

## Usage:

_Drop either the ServiceAir or ServiceGround sqf files into your missions scripts folder (this can be in a different location, but you will need to point the trigger to it correctly)_

_Set up a trigger for your targeted SIDE with the activation settings PRESENT and REPEATABLE:_

_Place the following code into the Condition field of said trigger:_


## AIR VEHICLES
_Place the following code into the Condition field of said trigger:_

```
call{{_x iskindof "air" && speed _x < 1} count thislist > 0  };
```
_In the On Activation field of your trigger, input the following code:_

```
call{_handle = [(thisList select 0)] execVM "scripts\ServiceAir.sqf";}
```

## GROUND VEHICLES

_Place the following code into the Condition field of said trigger:_

```
call{{_x iskindof "landvehicle" && speed _x < 1} count thislist > 0  };
```
_In the On Activation field of your trigger, input the following code:_

```
call{_handle = [(thisList select 0)] execVM "scripts\ServiceGround.sqf";}



_It is possible to delay the start of the servicing proccess by giving the countdown a timer after the conditions have been reached._



## Additional Notes

