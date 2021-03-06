#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_side"];

if (isServer) then {
	INFO_1("Players of side %1 teleported.", _side);
};

if (hasInterface && {playerSide == _side}) then {
	private ["_pos"];
	[{_pos = player getVariable "startPosition"; !isNil "_pos"}, {
		[false] call ga_drop_fnc_twoLineHint;

		if !([player] call ga_drop_fnc_isCommander) then {
			player say "taskSucceeded";
		};

		_pos = player getVariable "startPosition";
		INFO_1("Teleporting player to %1 for game start.", _pos);
		[{
			params ["_pos"];
			_onTP = {
				[false] call ga_drop_fnc_showWeatherPreview;
				openMap [false, false];
			};
			if (playerSide == WEST) then {_pos = [[-500, -500, 0]] call ga_drop_fnc_findRandomPos;}else{_pos = [OPFERSPAWN] call ga_drop_fnc_findRandomPos;};
			[player,_pos,_onTP] call ga_drop_fnc_teleport;
		}, [_pos], random 2] call CBA_fnc_waitAndExecute;
	}, []] call CBA_fnc_waitUntilAndExecute;
};
