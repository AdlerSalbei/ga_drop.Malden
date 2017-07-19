params ["_buyPosOpfor","_vehicleSpawn","_cargospacePos"];

if (!hasInterface) exitWith {};
if (isNil "_buyPosOpfor") exitWith {};
if (isNull _buyPosOpfor) exitWith {};

[{!isNull (_this select 0)}, {
    [{
        params ["_buyPosOpfor","_vehicleSpawn","_cargospacePos"];

        [_buyPosOpfor,"opf_" + drop_missionParam_OPFORFACTION,_cargospacePos,_vehicleSpawn,"THE CACHE","Buy Equipment", {side (_this select 1) == EAST && alive (_this select 0)}] call grad_lbm_fnc_addInteraction;
    }, _this, 2] call CBA_fnc_waitAndExecute;

}, [_buyPosOpfor,_vehicleSpawn,_cargospacePos]] call CBA_fnc_waitUntilAndExecute;
