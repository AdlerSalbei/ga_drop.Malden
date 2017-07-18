if (!hasInterface) exitWith {};

[true,"OPFOR IS CHOOSING DEFENSIV POSITION","PLEASE WAIT"] call ga_drop_fnc_twoLineHint;

_isCommander = false;
if (!isNil "bluforcommander") then {_isCommander = (player == bluforcommander)};
[{!isNil "OPFORSPAWN"}, {
    if (_this) then {
        [true,"CHOOSE DROP ZONE (LMOUSE)","CONFIRM (ENTER)"] call ga_drop_fnc_twoLineHint;
    } else {
        [true,"COMMANDER IS CHOOSING DROP ZONE","PLEASE WAIT"] call ga_drop_fnc_twoLineHint;
    };
}, _isCommander] call CBA_fnc_waitUntilAndExecute;