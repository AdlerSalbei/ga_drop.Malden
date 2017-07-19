if (!isServer) exitWith {};

//random
if (drop_missionParam_TIMEOFDAY == -1) then {
    drop_missionParam_TIMEOFDAY = selectRandom [7,8,9,10,11,12,13,14,15,16,17,18];
};

_hour = if (drop_missionParam_TIMEOFDAY > 0) then {drop_missionParam_TIMEOFDAY - 1} else {23};
_minute = 60 - (round (drop_missionParam_SETUPTIME/60));

_date = [2] call ga_drop_fnc_findMaxMoonDate;
_date set [3,_hour];
_date set [4,_minute];

["LOG", "SERVER_SETUP", format ["fn_setTime - Setting date to %1", _date]] call ga_drop_fnc_diagReport;

[_date] call bis_fnc_setDate;
