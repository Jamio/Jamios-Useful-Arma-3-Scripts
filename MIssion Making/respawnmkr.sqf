/*
HOW TO USE:

1. Drop script into mission folder

2. Name respawn point as "respawn_west"

3. Name whatever you want the respawn point to follow as "respawnbox1"

4. Compile script in init.sqf with: [] execVM "scripts\respawnmkr.sqf";

*/


while {true} do {
"respawn_west" setmarkerpos getpos respawnbox1;
sleep 180;
};
