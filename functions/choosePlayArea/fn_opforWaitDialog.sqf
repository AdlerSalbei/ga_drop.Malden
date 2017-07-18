if (!hasInterface) exitWith {};

if ([player] call ga_drop_fnc_isCommander) then {
    [true,"CHOOSE PLAYZONE (LMOUSE)","CONFIRM (ENTER)"] call ga_drop_fnc_twoLineHint;
} else {
    if (side player == EAST) then {
        [true,"COMMANDER IS CHOOSING DEFENSIV POSITION","PLEASE WAIT"] call ga_drop_fnc_twoLineHint;
    } else {
        [true,"OPFOR IS CHOOSING DEFENSIV POSITION","PLEASE WAIT"] call ga_drop_fnc_twoLineHint;
    };
};