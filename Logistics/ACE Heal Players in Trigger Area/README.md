# ACE Heal Players
## Description:
_This code can be used to heal players fully using the ACE medical system._

_The function can is available in two forms - automatically via a trigger, or directly via an interaction with an object_

## Usage:
_Set up a trigger for your specificed side, with the activation conditions PRESENT and REPEATABLE:_

_Place the following code in the On Activation field of said trigger:

```
{[objNull, _x] call ace_medical_treatment_fnc_fullHeal} forEach thisList;

```

_It is also possible to produce this effect via player interaction with an object_

_In this case, you will need an object or unit with a variable name - the example script uses `doctor_1` but this can be changed to suit your needs, and even have multiple heal objects.

```
doctor_1 addAction
[ "Get Medical Treatment",
 { _list = (_this select 1) nearEntities ["Man", 10]; {[_x] call ace_medical_treatment_fnc_fullHealLocal;} forEach _list; },
 nil,
 1.5,
 true,
 true,
 "",
 "_target distance _this <3",
 50,
 false,
 "",
 "" ];

```
_This code makes a variable _list, and searches within 10 metres of the doctor_1 object for entities under the Cfg class "Man". It then iterates through them and conducts the fullHealLocal function from ACE medical.


## Additional Notes

