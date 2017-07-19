#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};
if (drop_missionParam_PRESET == "DEBUG") exitWith {};

drop_fnc_checkBluKilled_preEliminated = {
    [{
        if (({side _x == west} count playableUnits) == 0) then {
                [] call drop_fnc_checkBluKilled_eliminated;
                [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 5, []] call CBA_fnc_addPerFrameHandler;
};

drop_fnc_checkBluKilled_eliminated = {
    [{
        if (({side _x == west} count playableUnits) == 0) then {
            _downSince = missionNamespace getVariable ["drop_bluDownSince", 0];
            missionNamespace setVariable ["drop_bluDownSince", _downSince + 1];
        } else {
            missionNamespace setVariable ["drop_bluDownSince", 0];
            [] call drop_fnc_checkBluKilled_preEliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        if (missionNamespace getVariable ["drop_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
        drop_endInProgressServer = true;

        [drop_missionstart_defendTask,"SUCCEEDED",false] call BIS_fnc_taskSetState;
        [drop_missionstart_captureTask,"FAILED",false] call BIS_fnc_taskSetState;
        missionNamespace setVariable ["drop_gameEnded", ["EAST", "BLUFOR ELIMINATED!"], true];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call drop_fnc_checkBluKilled_preEliminated;
