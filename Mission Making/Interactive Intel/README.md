# Simple Interactive Intel
## Description:
_This code adds interactable intel for players. The interaction allows players to inspect an image and also text defined by the mission maker._

_The image will attempt to be printed on the object, so using things like notepads, posters etc. is recommended, but you can theoretically use any object, it might just not work as well._

## Usage:

_Create an object that you wish to use as interactive intel._

_Add the following code to the object's init box:_

```
["init", [this, "image.jpg", "Text message"]] call BIS_fnc_initLeaflet
```

_Replace "image.jpg" with your desired image. These images can be JPEGs, but PAA's are preferred, otherwise players will see a black texture until they are close._

_Replace "Text message" with your desired text for when players inspect the intel. I typically use this for translations, or a hint as to what the player is actually looking at in the image._

## Additional Notes
