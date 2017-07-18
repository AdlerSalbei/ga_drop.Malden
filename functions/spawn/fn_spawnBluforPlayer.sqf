params ["_plane"];

[player] call zade_boc_fnc_actionOnChest;
player addBackpack "B_Parachute";
player linkItem "ACE_Altimeter";
_plane moveInCargo _player;