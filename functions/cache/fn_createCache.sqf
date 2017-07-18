if !(isServer) exitWith {};
params ["_pos"];

_nBuilding = nearestBuilding _pos;
_buildingPos = getPos (_nBuilding select 0);

_cache = "" createVehicle _buildingPos;
_cache setPos _buildingPos;
[_buildingPos] call ga_drop_fnc_spawnPlayer;

clearWeaponCargoGlobal _cache;
clearMagazineCargoGlobal _cache;
clearBackpackCargoGlobal _cache;
clearItemCargoGlobal _cache;

//[_cache] call ga_drop_fnc_trackCache;
[_cache, "Cache to Defend!", 120] call ga_drop_temp3DMarker;
