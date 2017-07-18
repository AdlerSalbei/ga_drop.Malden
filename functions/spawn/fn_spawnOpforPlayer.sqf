params ["_unit",["_pos", [0,0,0]]];

if (!local _unit) exitWith {};

_unit allowDamage false;
_unit setPos _pos;
[{
    params ["_unit"];
    _unit allowDamage true;;
}, [_unit], 2] call CBA_fnc_waitAndExecute;