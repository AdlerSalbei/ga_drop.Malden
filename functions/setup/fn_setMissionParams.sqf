if (!isServer) exitWith {};

//FACTIONS =====================================================================
drop_missionParam_BLUFORFACTION = [
    "us_army"
] select ("BluforFaction" call BIS_fnc_getParamValue);
drop_missionParam_OPFORFACTION = [
    "ind_me_terrorists"
] select ("OpforFaction" call BIS_fnc_getParamValue);
drop_missionParam_ISWOODLAND = ["isWoodland"] call ga_drop_fnc_getIslandCfgValue;

publicVariable "drop_missionParam_BLUFORFACTION";
publicVariable "drop_missionParam_OPFORFACTION";
publicVariable "drop_missionParam_ISWOODLAND";

["LOG", "SERVER_SETUP", "drop_missionParam_BLUFORFACTION"] call ga_drop_fnc_diagReport;
["LOG", "SERVER_SETUP", "drop_missionParam_OPFORFACTION"] call ga_drop_fnc_diagReport;
["LOG", "SERVER_SETUP", "drop_missionParam_ISWOODLAND"] call ga_drop_fnc_diagReport;

//NON drop_missionParam_PRESET PARAMS ============================================================
drop_missionParam_WEATHERSETTING = "WeatherSetting" call BIS_fnc_getParamValue;
drop_missionParam_TIMEOFDAY = "TimeOfDay" call BIS_fnc_getParamValue;

publicVariable "drop_missionParam_WEATHERSETTING";
publicVariable "drop_missionParam_TIMEOFDAY";

//GET drop_missionParam_PRESET ===================================================================
drop_missionParam_PRESET = [
    "CUSTOM",
    "DEBUG"
] select ("Preset" call BIS_fnc_getParamValue);

publicVariable "drop_missionParam_PRESET";

["LOG", "SERVER_SETUP", "drop_missionParam_PRESET"] call ga_drop_fnc_diagReport;

//SET drop_missionParam_PRESET PARAMS ============================================================
switch (drop_missionParam_PRESET) do {
    case ("CUSTOM"): {
        drop_missionParam_CONTROLRATIO = "ControlRatio" call BIS_fnc_getParamValue;
        drop_missionParam_CAPTURETIME= "CaptureTime" call BIS_fnc_getParamValue;
        drop_missionParam_DEFENSETIME = "DefenseTime" call BIS_fnc_getParamValue;
    };

    case ("DEBUG"): {
        drop_missionParam_CONTROLRATIO = 1;
        drop_missionParam_CAPTURETIME= 1200;
        drop_missionParam_DEFENSETIME = 3600;

        [false] call grad_lbm_tracking_fnc_enableTracking;
    };
};

publicVariable "drop_missionParam_CONTROLRATIO";
publicVariable "drop_missionParam_CAPTURETIME";
publicVariable "drop_missionParam_DEFENSETIME";

["LOG", "SERVER_SETUP", "drop_missionParam_CONTROLRATIO"] call ga_drop_fnc_diagReport;
["LOG", "SERVER_SETUP", "drop_missionParam_CAPTURETIME"] call ga_drop_fnc_diagReport;
["LOG", "SERVER_SETUP", "drop_missionParam_DEFENSETIME"] call ga_drop_fnc_diagReport;

//DONE =========================================================================
missionNamespace setVariable ["drop_init_missionParamsDone", true, true];
