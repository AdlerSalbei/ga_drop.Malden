params ["_cache"];

[{
	params ["_args", "_handle"];
	_args params ["_cache"];
	_nBuilding = nearestBuilding _cache;
	if (((getPos _cache) (getPos (_nBuilding select 0))) ) then {
		
	};

},5, [_cache]] call CBA_fnc_perFrameHandler;
