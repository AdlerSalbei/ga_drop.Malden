#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_id","_uid","_name","_jip","_ownerID"];
if !(_jip) exitWith {};

if (time <= 600) then {
	INFO_1("Player %1 is JIP. Handling spawn position.",_name);


	[{!isNull ([_this select 0] call BIS_fnc_getUnitByUID)}, {
		_unit = [_this select 0] call BIS_fnc_getUnitByUID;

		if (side _unit == WEST && missionNamespace getVariable ["ga_drop_bluforSpawnSet", false]) then {
			_startPos = [getPos (ga_drop_dropZone select 0), [5,25]] call ga_drop_fnc_findRandomPos;
			_unit setVariable ["startPosition", _startPos, true];
		};

		if (side _unit == EAST && missionNamespace getVariable ["ga_drop_opforSpawnSet", false]) then {
			_startPos = [getPos ga_drop_cache, [0,50]] call ga_drop_fnc_findRandomPos;
			_unit setVariable ["startPosition", _startPos, true];
		};
	}, [_uid]] call CBA_fnc_waitUntilAndExecute;
}else{
	_unit setDamage 1;
};
