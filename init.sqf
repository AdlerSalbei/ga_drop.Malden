enableEnvironment [false, true];
0 = execVM "grad_civs\init.sqf";
[[west, east], [civilian, independent]] call ace_spectator_fnc_updateSpectatableSides;
