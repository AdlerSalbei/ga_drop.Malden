/* FUNCTION NOT IN USE */

#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_waitTime"];
[{
    if (ga_drop_defenseTimeLeft < 0) exitWith {};
    INFO_1("%1s left in the round.");

    _text = format ["%1 left in the round.",[(round (ga_drop_defenseTimeLeft/60))*60,"MM:SS"] call BIS_fnc_secondsToString];
    ["uo_notification",["URBAN OPS",_text]] remoteExec ["bis_fnc_showNotification",0,false];

    _nextWaitTime = ga_drop_defenseTimeLeft - ((floor ((ga_drop_defenseTimeLeft / 60) / 2)) * 60);
    if (_nextWaitTime > 60) then {
        [_nextWaitTime] call ga_drop_fnc_timeNotifications;
    };
}, [], _waitTime] call CBA_fnc_waitAndExecute;
