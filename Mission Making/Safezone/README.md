# Safezone
## Description:
_This script allows you to create safe areas where grenades and projectiles cannot be thrown or fired._

_Players will still be able to fire, but the resulting projectile is instantly deleted and a message warning will appear on their screen._

## Usage:

_Place the grenadeStop.sqf file in your scripts folder_

_Add the following code to your init.sqf_

```
execVM "scripts\grenadeStop.sqf";
```

_Enter the grenadeStop.sqf script and edit the two #defines to add or remove safety zones. These are arrays of markers and their radii. You can also edit the message that appears when players shoot in the second #define_

_By default, the script looks for a marker with the variable name "marker_1" and produces a safezone of 500 metres from its centre._

## Additional Notes

The grenadeStop script was originally produced by Bake for the Arma 3 Alpha, but the script here was edited by Rarek.