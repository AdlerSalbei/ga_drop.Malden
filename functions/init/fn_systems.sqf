[{!isNull player || isDedicated},{

    //init
    [] call ga_drop_fnc_setMissionParams;
    [] call ga_drop_fnc_setOriginalSide;
    [] call ga_drop_fnc_createCustomLocations;
    [] call ga_drop_fnc_pubVars;

    //setup on mission start
    [{missionNamespace getVariable ["ga_drop_missionParamsDone", false]}, {[] call ga_drop_fnc_loadoutFaction}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_missionParamsDone", false]}, {[] call ga_drop_fnc_setTime}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_missionParamsDone", false]}, {[] call ga_drop_fnc_setWeather}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_missionParamsDone", false]}, {[] call ga_drop_fnc_setupCountdown}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_pubVarsDone", false]}, {[] call ga_drop_fnc_createLocationMarkers}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_pubVarsDone", false]}, {[] call ga_drop_fnc_choosePositionOpfor}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_pubVarsDone", false]}, {[] call ga_drop_fnc_chooseSpawn}, []] call CBA_fnc_waitUntilAndExecute;

    //report
    if (isServer) then {[{["PRINT", "SERVER_SETUP"] call drop_common_fnc_diagReport}, [], 15] call CBA_fnc_waitAndExecute};

    //setup after player choices
    [{missionNamespace getVariable ["ga_drop_cityChosen", false]}, {[] call ga_drop_fnc_playAreaSetup}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_cityChosen", false]}, {[] call ga_drop_fnc_initCivs}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_playAreaSetupDone", false]}, {[] call ga_drop_fnc_findOpfStartPos}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_opforSpawnSet", false]}, {[EAST] call ga_drop_fnc_tpSide}, []] call CBA_fnc_waitUntilAndExecute;
    [{!isNil "OPFORSPAWN"}, {[] call ga_drop_fnc_createTrigger}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_bluforSpawnSet", false]}, {[WEST] call ga_drop_fnc_tpSide}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_bluforSpawnSet", false]}, {[] call ga_drop_fnc_startMission}, []] call CBA_fnc_waitUntilAndExecute;

    //on game start
    [{missionNamespace getVariable ["ga_drop_gamestarted", false]}, {[] call drop_endings_fnc_checkBluKilled}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_gamestarted", false]}, {[] call drop_endings_fnc_checkOpfKilled}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_gamestarted", false]}, {[] call drop_endings_fnc_checkDefense}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_gamestarted", false]}, {[] call drop_endings_fnc_checkCapture}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["ga_drop_gamestarted", false]}, {[] call drop_endings_fnc_endMission}, []] call CBA_fnc_waitUntilAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;
