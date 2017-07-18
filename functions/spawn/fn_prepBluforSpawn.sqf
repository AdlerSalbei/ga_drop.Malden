if !(isServer) exitWith {};

BLUFORDROPZONE params ["_x", "_y","_z"];
_group = createGroup [west, true];
_plane = "RHS_C130J" createVehicle [-500, -500, 700];
_pilot = "B_Pilot_F" createUnit [-500, -500, 0, _group];

_plane assignAsDriver _pilot;
_plane moveInDriver _pilot;

[_plane] remoteExecCall ["ga_drop_fnc_spawnBluforPlayers", west];

{
	if ((side _x) == "Blufor") then {};
}forEach allPlayers;

_group move [_x, _y,(_z + 1000)];