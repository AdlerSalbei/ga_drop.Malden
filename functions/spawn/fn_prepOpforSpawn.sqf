params ["_pos"];

{
	if ((side _x) == "Opfor") then {
		_spawnPosOpfor = [_pos, , ] call SHK_pos;
		[_x, _spawnPosOpfor] call spawnOpforPlayers;
	};
}forEach allPlayers;


