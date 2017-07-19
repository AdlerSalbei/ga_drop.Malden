#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

INFO_1("Defense time check starting... OPFOR has to defend for %1s", drop_missionParam_DEFENSETIME);
ga_drop_defenseTimeLeft = drop_missionParam_DEFENSETIME;

ga_drop_fnc_checkDefense_addPFH = {
    ga_drop_defenseTimeLeft_lastTickTime = CBA_missionTime;

    [{
        ga_drop_defenseTimeLeft = ga_drop_defenseTimeLeft - (CBA_missionTime - ga_drop_defenseTimeLeft_lastTickTime);
        ga_drop_defenseTimeLeft_lastTickTime = CBA_missionTime;
        ga_drop_defenseTimeLeft = ga_drop_defenseTimeLeft max 0;
        publicVariable "ga_drop_defenseTimeLeft";

        if (round ga_drop_defenseTimeLeft in [900,600,300,60]) then {
            _text = format ["%1 left in the round.",[(round (ga_drop_defenseTimeLeft/60))*60,"MM:SS"] call BIS_fnc_secondsToString];
            ["drop_notification",["DROP",_text]] remoteExec ["bis_fnc_showNotification",0,false];
        };

        if (ga_drop_defenseTimeLeft > 0) exitWith {};

        [_this select 1] call CBA_fnc_removePerFrameHandler;

        [{!BLUFORINCONTROL || ga_drop_defenseTimeLeft > 0}, {
            if (ga_drop_defenseTimeLeft > 0) exitWith {[] call ga_drop_fnc_checkDefense_addPFH};

            if (missionNamespace getVariable ["drop_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
            drop_endInProgressServer = true;

            [drop_missionstart_defendTask,"SUCCEEDED",false] call BIS_fnc_taskSetState;
            [drop_missionstart_captureTask,"FAILED",false] call BIS_fnc_taskSetState;
            missionNamespace setVariable ["drop_gameEnded", ["EAST","CITY DEFENDED!"], true];
            INFO("OPFOR has defended the location.");
        }, []] call CBA_fnc_waitUntilAndExecute;
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call ga_drop_fnc_checkDefense_addPFH;
