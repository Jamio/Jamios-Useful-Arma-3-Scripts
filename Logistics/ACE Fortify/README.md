# ACE Fortify Expanded
## Description:
_This function builds on the normal ACE fortify system that lets players build fortifications using a budget._

_The script adds the ability to switch between different building types, only build in a limited area near supplies and a way to refill the supply budget._

_By default, players can only build when in 150m of the Construction Crate, and have a limited budget for the entire crate._

_Different "blueprint" groups can be assigned within the Construction Crate. These are switchable via an ACE interaction._

## Usage:

_Drop the `cv_logistics_init_fortify.sqf` script into your missions scripts folder._

_Create two objects in your mission. Name them `constructionCrate1` and `refillCrate1`._

_`constructionCrate1` is the moveable container for building. `refillCrate1` is the static object that can be used to refill the supply budget of the construction crate._

_Adjust the `cvo_maxBudget` and `cvo_refillBudget` parameters for your mission. Adjust the distance in the second part if needed (default 150m)._

_Group the objects you want to be deployable in the editor, and make an array of them like so `[classnaname, cost], [classname, cost]`. Paste this new array in place of the existing objects as part of the parts labelled `_code_p2` for each preset you want players to have access to.

_Go down the script and adjust the names of each each preset. Look for the areas named `_cvo_Fort_preset2 = [xxxxyyyyzzz]` and change the bits labelled Name for ACE Interaction Menu._

_Once you are happy with your presets. Compile the script in the init.sqf with:

```
[compileScript ["scripts\cvo_logistics_init_fortify.sqf"]] call CBA_fnc_directCall;
```

_Check that the path matches your location, and test._



_More than 3 presets can be used by adding another preset code. Probably best done by copying everything from another and pasting it at the bottom of the script. Variables will need to be renamed obviously._



## Additional Notes
This script was built off of code supplied by OverlordZorn on the ACE Discord and then updated by me. All thanks in getting this set up go to him.
