/*    Tells server that pre-game briefing is done
*
*/

if (!hasInterface) exitWith {};

[{getClientState == "BRIEFING READ"}, {
    if (!(missionNamespace getVariable ["drop_init_briefingDone", false])) then {
        ["%1 was first to complete briefing.", name player] call ga_drop_fnc_serverLog;
        missionNamespace setVariable ["drop_init_briefingDone", true, true];
    };
}, []] call CBA_fnc_waitUntilAndExecute;
