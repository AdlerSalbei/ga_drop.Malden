#include "\z\ace\addons\main\script_component.hpp"

params ["_player", "_killer"];

[player, true] call TFAR_fnc_forceSpectator;
setPlayerRespawnTime 0;
[true] call ace_spectator_fnc_setSpectator;