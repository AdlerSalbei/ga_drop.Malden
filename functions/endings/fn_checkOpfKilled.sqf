#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};
if (drop_missionParam_PRESET == "DEBUG") exitWith {};

drop_fnc_checkOpfKilled_preEliminated = {
    [{
        if (({side _x == east} count playableUnits) == 0 && BLUFORINCONTROL) then {
            [] call drop_fnc_checkOpfKilled_eliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 10, []] call CBA_fnc_addPerFrameHandler;
};


drop_fnc_checkOpfKilled_eliminated = {
    [{
        if (({side _x == east} count playableUnits) == 0 && (BLUFORINCONTROL) then {
            _downSince = missionNamespace getVariable ["drop_opfDownSince", 0];
            missionNamespace setVariable ["drop_opfDownSince", _downSince + 1];
        } else {
            missionNamespace setVariable ["drop_opfDownSince", 0];
            [] call drop_fnc_checkOpfKilled_preEliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        if (missionNamespace getVariable ["drop_opfDownSince", 0] > 15) then {
            if (missionNamespace getVariable ["drop_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
            drop_endInProgressServer = true;

            [drop_missionstart_captureTask,"SUCCEEDED",false] call BIS_fnc_taskSetState;
            [drop_missionstart_defendTask,"FAILED",false] call BIS_fnc_taskSetState;
            missionNamespace setVariable ["drop_gameEnded", ["WEST", "OPFOR ELIMINATED!"], true];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call drop_fnc_checkOpfKilled_preEliminated;
