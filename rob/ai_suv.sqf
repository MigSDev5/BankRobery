private ["_randomChanger","_random1337","_suvGroup","_suv","_gunner","_driver","_suvWP","_loadout","_aiwep","_aiammo"];
///Spawn a SUV with a driver & gunner near the bank.///

_suvGroup = createGroup EAST;
_randomPos = [[6859.4697,7613.2573,0],[6944.853, 7830.6338,0],[7123.064, 7481.7334,0],[7336.916, 7659.4526,0]] call BIS_fnc_selectRandom;
	
_suv = createVehicle ["ArmoredSUV_PMC_DZE",_randomPos, [], 0, "CAN_COLLIDE"];
_suv setDir round random 360;
_suv setFuel 1;
_suv allowDammage true;

_gunner = _suvGroup createUnit ["BAF_Soldier_L_DDPM",getPos _suv, [], 0, "PRIVATE"];

_gunner assignAsGunner _suv;
_gunner moveInGunner _suv;
_suvGroup selectLeader _gunner;
sleep 15;
_driver = _suvGroup createUnit ["BAF_Soldier_L_DDPM",getPos _suv, [], 0, "PRIVATE"];
_driver assignAsDriver _suv;
_driver moveInDriver _suv;

dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_suv];

_suvWP = _suvGroup addWaypoint [[6999.4351, 7665.9795,0],0];
_suvWP setWaypointType "MOVE";
	
_loadout = ["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"];
{
    _x enableAI "TARGET";
    _x enableAI "AUTOTARGET";
    _x enableAI "MOVE";
    _x enableAI "ANIM";
    _x enableAI "FSM";
    _x allowDammage true;
    _x setCombatMode "RED";
    _x setBehaviour "COMBAT";
    removeAllWeapons _x
    _aiwep = _loadout select 0;
    _aiammo = _loadout select 1;
    _x addWeapon _aiwep;
    _x addMagazine _aiammo;
    _x addMagazine _aiammo;
    _x setSkill ["aimingAccuracy",1];
    _x setSkill ["aimingShake",1];
    _x setSkill ["aimingSpeed",1];
    _x setSkill ["endurance",1];
    _x setSkill ["spotDistance",0.6];
    _x setSkill ["spotTime",1];
    _x setSkill ["courage",1];
    _x setSkill ["reloadSpeed",1];
    _x setSkill ["commanding",1];
    _x setSkill ["general",1];
} count (units _suvGroup);
