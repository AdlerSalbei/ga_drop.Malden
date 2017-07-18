["ga_drop_handleJIP", "onPlayerConnected", {
    _this call ga_drop_fnc_handleJIP;
}] call BIS_fnc_addStackedEventHandler;

["Initialize", [true]] call BIS_fnc_dynamicGroups;

[] execVM "tfarsettings.sqf";

