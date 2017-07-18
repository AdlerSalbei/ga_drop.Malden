if (!hasInterface) exitWith {};
if (player getVariable ["originalSide", "UNKNOWN"] != "WEST") exitWith {};
if (missionNamespace getVariable ["ga_drop_dropChosen", false]) exitWith {};


[{!isNull (findDisplay 46)}, {
    [true] call ga_drop_fnc_showWeatherPreview;
    [3,{ga_drop_preloadFinished = true}] call ga_drop_fnc_wait3Dframes;
}, []] call CBA_fnc_waitUntilAndExecute;


[{missionNamespace getVariable ["ga_drop_preloadFinished",false]}, {
    openMap [true, true];
    [] call ga_drop_fnc_bluforWaitDialog;
}, []] call CBA_fnc_waitUntilAndExecute;


if !([player] call ga_drop_fnc_isCommander) exitWith {};

[{!isNil "OPFORSPAWN"}, {
    ["Blufor Commander %1 is now choosing a city.", profileName] call ga_drop_fnc_serverLog;

    //MAPCLICK EVENT ===============================================================
    slb_chooseDropClick = [
        "slb_chooseDrop",
        "onMapSingleClick",
        {
            [WEST,"spawnMarker",true,_pos,"hd_start","COLORWEST"] call ga_drop_fnc_createSideMarker;
            BLUFORDROPZONE = _pos;
        }
    ] call BIS_fnc_addStackedEventHandler;

    //CONFIRM SELECTION ============================================================
    slb_onDropKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {

        if ((_this select 1 == 28)||(_this select 1 == 156)) then {
            if (isNil "BLUFORDROPZONE") then {
                ["PLEASE CHOOSE A DROP ZONE BY CLICKING ON THE MAP"] call ga_drop_fnc_confirmHint;

            } else {
				//position in water
				if (surfaceIsWater BLUFORDROPZONE) then {
					["PLEASE CHOOSE A SPAWN POSITION ON LAND"] call ga_drop_fnc_confirmHint;
				} else {
					//position successfully chosen
					["fn_chooseDrop - %1 chose Drop at %2.", profileName, BLUFORDROPZONE] call ga_drop_fnc_serverLog;
					[true,"SETTING UP SPAWN","PLEASE WAIT"] call ga_drop_fnc_twoLineHint;

					ga_drop_dropChosen = true;
					publicVariable "ga_drop_dropChosen";
					publicVariable "BLUFORDROPZONE";

					["slb_chooseDrop", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
					(findDisplay 46) displayRemoveEventHandler ["KeyDown", slb_onDropKeyDown];
                };
            };
        };
    }];
}, []] call CBA_fnc_waitUntilAndExecute;