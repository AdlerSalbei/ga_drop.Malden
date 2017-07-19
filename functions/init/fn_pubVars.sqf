if (!isServer) exitWith {};

//SETTINGS =====================================================================
CIVILIANPROBABILITY = 3.5;
OPFORTELEPORTED = false;
BLUFORTELEPORTED = false;
GAMESTARTED = false;
GAMEENDED = false;
BLUFORINCONTROL = false;
BLUFORELIMINATED = false;
OPFORELIMINATED = false;
CAPTURETIMEREMAINING = uo_missionParam_CAPTURETIME;

publicVariable "CIVILIANPROBABILITY";
publicVariable "OPFORTELEPORTED";
publicVariable "BLUFORTELEPORTED";
publicVariable "GAMESTARTED";
publicVariable "GAMEENDED";
publicVariable "BLUFORINCONTROL";
publicVariable "BLUFORELIMINATED";
publicVariable "OPFORELIMINATED";
publicVariable "CAPTURETIMEREMAINING";

//DONE =========================================================================
missionNamespace setVariable ["uo_init_pubVarsDone", true, true];
