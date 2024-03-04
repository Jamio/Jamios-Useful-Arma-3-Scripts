# Simple Teleport
## Description:
_This script allows you to create an action that teleports players to a desired location._


## Usage:

_Create an object you wish to use as the teleporter._

_Add the following code to the init box of the teleporter object:_

```
this addAction ["Travel to Pleiku Boat Base", {player setPos (getPos teleport2)}]
```

_Edit the first parameter to change the action's text_

_By default, the script looks for a marker with the variable name "marker_1" and produces a safezone of 500 metres from its centre._

## Additional Notes

The grenadeStop script was originally produced by Bake for the Arma 3 Alpha, but the script here was edited by Rarek.