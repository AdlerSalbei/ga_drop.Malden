#include "\x\cba\addons\main\script_macros_mission.hpp"

private ["_condition","_onActivation","_onDeactivation"];

if (isServer) then {
    _condition = "
        drop_unitsInArea = thisList;
        ((west countSide thisList) max 0.01)/((east countSide thisList) max 0.1) >= drop_missionParam_CONTROLRATIO;
    ";

    _onActivation = "
        BLUFORINCONTROL = true;
        publicVariable 'BLUFORINCONTROL';
        [[],'Report','BLUFOR is taking control!'] remoteExec ['ga_drop_fnc_sideNotification',0,false];
    ";

    _onDeactivation = "
        BLUFORINCONTROL = false;
        publicVariable 'BLUFORINCONTROL';
        [[],'Report','BLUFOR is no longer in control.'] remoteExec ['ga_drop_fnc_sideNotification',0,false];
    ";
} else {
    _condition = "drop_unitsInArea = thisList;";
    _onActivation = "";
    _onDeactivation = "";
};


_trigger = createTrigger ["EmptyDetector", OPFORSPAWN, false];
_trigger setTriggerArea [2,2,0,false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [_condition,_onActivation,_onDeactivation];
_trigger setTriggerTimeout [5,10,20,true];

missionNamespace setVariable ["drop_init_triggerCreated", true, true];

INFO_1("Area trigger created: %1.", _trigger);
