#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

[{
    if (BLUFORINCONTROL) then {
        CAPTURETIMEREMAINING = CAPTURETIMEREMAINING - 1;
        publicVariable "CAPTURETIMEREMAINING";

        if (CAPTURETIMEREMAINING <= 0) then {
            if (missionNamespace getVariable ["drop_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
            drop_endInProgressServer = true;

            [drop_missionstart_captureTask,"SUCCEEDED",false] call BIS_fnc_taskSetState;
            [drop_missionstart_defendTask,"FAILED",false] call BIS_fnc_taskSetState;
            missionNamespace setVariable ["drop_gameEnded", ["WEST", "CITY CAPTURED!"], true];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    };
} , 1, []] call CBA_fnc_addPerFrameHandler;
