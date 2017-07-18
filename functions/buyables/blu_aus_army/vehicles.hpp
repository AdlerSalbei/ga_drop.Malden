class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
	spawnEmpty = 1;
	
    class rhsusf_m998_w_s_4dr_fulltop {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Commandvehicle";
        description = "Seats: 4<br/><br/>Functions as a backup respawn and buymenu access position.";
        code = "if (isServer) then {[_this select 2] call uo_missionObjectives_fnc_setCommandVehicle};";
        price = 10000;
        stock = 2;
    };

    class rhsusf_m998_d_s_4dr_fulltop: rhsusf_m998_w_s_4dr_fulltop {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsusf_m1025_w {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (unarmed)";
        description = "Seats: 4";
        price = 2000;
        stock = 10;
    };

    class rhsusf_m1025_d: rhsusf_m1025_w {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsusf_m998_w_2dr_halftop {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (2D/Open)";
        description = "Seats: 8";
        price = 1800;
        stock = 10;
    };

    class rhsusf_m998_d_2dr_halftop: rhsusf_m998_w_2dr_halftop {
        condition = "!uo_missionParam_ISWOODLAND";
    };
};