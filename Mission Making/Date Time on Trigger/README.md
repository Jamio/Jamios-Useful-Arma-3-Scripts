# Date and Time info on Trigger
## Description:
_This small piece of code will produce some text that reveals the players current location, date and time._

_Only the location name needs to be set manually - by default this is Misfits PMC FOB_

## Usage:

_Create a trigger with your desired conditions, most likely player present._

_Add the following code to the On Activation section._

```
[ 
["Misfits PMC FOB", 2, 3, 5],  
[format ["Date: %1-%2-%3", date select 0, date select 2, date select 1], 2, 1, 5], 
[format ["Time: %1:%2", date select 3, date select 4], 2, 1, 5], 
[format ["Grid: %1", mapGridPosition player], 2, 1, 5] 
] spawn BIS_fnc_EXP_camp_SITREP;
```

## Additional Notes
