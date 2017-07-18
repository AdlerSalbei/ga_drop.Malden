if (!hasInterface) exitWith {};
if (player getVariable ["originalSide", "UNKNOWN"] != "EAST") exitWith {};
if (missionNamespace getVariable ["ga_drop_spawnChosen", false]) exitWith {};

[{!isNull (findDisplay 46)}, {
    [true] call ga_drop_fnc_showWeatherPreview;
    [3,{ga_drop_preloadFinished = true}] call ga_drop_fnc_wait3Dframes;
}, []] call CBA_fnc_waitUntilAndExecute;

[{!isNull (findDisplay 46) && (missionNamespace getVariable ["ga_drop_preloadFinished",false])}, {

    openMap [true, true];
    [] call ga_drop_fnc_opforWaitDialog;

    if (isNil "opforcommander") exitWith {};
    if (player != opforcommander) exitWith {};

    ["Opfor Commander %1 is now choosing a defensiv position.", profileName] call ga_drop_fnc_serverLog;

    //MAPCLICK EVENT ===============================================================
    slb_choosePositionClick = [
        "slb_choosePosition",
        "onMapSingleClick",
        {
			[EAST,"spawnMarker",true,_pos,"hd_start","COLOREAST"] call ga_drop_fnc_createSideMarker;
            OPFORSPAWN = _pos;
        }
    ] call BIS_fnc_addStackedEventHandler;

    //CONFIRM SELECTION ============================================================
    slb_onPositionKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
        if ((_this select 1 == 28)||(_this select 1 == 156)) then {
            if (isNil "CHOSENLOCATION") then {
                ["PLEASE CHOOSE A LOCATION!"] call ga_drop_fnc_confirmHint;

            } else {
                ["fn_chooseCity - %1 chose location %2", profileName, text CHOSENLOCATION] call ga_drop_fnc_serverLog;
                [EAST,"selectionMarker"] call ga_drop_fnc_deleteSideMarker;

                player say "taskSucceeded";
                [true,"SETTING UP PLAYZONE","PLEASE WAIT"] call ga_drop_fnc_twoLineHint;

                ga_drop_spawnChosen = true;
                publicVariable "ga_drop_spawnChosen";
                publicVariable "OPFORSPAWN";

                ["slb_choosePosition", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
                (findDisplay 46) displayRemoveEventHandler ["KeyDown", slb_onPositionKeyDown];
            };
        };
    }];
}, []] call CBA_fnc_waitUntilAndExecute;