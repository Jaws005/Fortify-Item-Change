//References
//https://ace3.acemod.org/wiki/framework/fortify-framework.html


//Use this version for the ACE Self Interact version
FON_fnc_CustomBarriersSelf = {
	[[east, 850, [["Land_HBarrier_3_F", 10],
				["Land_HBarrierWall6_F", 15],
				["Land_BagFence_Long_F", 5],
				["Land_BagFence_Round_F", 5]]], ace_fortify_fnc_registerObjects] remoteExec ["call", 2];
	//this provides a hint to everyone on server that the fortify objects have changed. You can name this whatever you want in the first bracketed section
	["Barrier Fortifications Available"] remoteExec ["hint", 0];
};

//Use this version for the addAction on object
FON_fnc_CustomBarriers = {
	params ["_object","_caller", "_ID"];
	//removes the action if you want to have a "cooldown" on changing the Fortify set.
	_object removeAction _ID;
	
	//you need to be careful with the brackets in order to make only 2 different parameters. Because we are using "call" as the order for remoteExec, it only asks for 2 parameters. We also use the number "2" at the very end because the registerObjects needs to be called on the server
	[[east, 850, [["Land_HBarrier_3_F", 10],
				["Land_HBarrierWall6_F", 15],
				["Land_BagFence_Long_F", 5],
				["Land_BagFence_Round_F", 5]]], ace_fortify_fnc_registerObjects] remoteExec ["call", 2];
	//this provides a hint to everyone on server that the fortify objects have changed. You can name this whatever you want in the first bracketed section
	["Barrier Fortifications Available"] remoteExec ["hint", 0];
	//this adds a "cooldown" before re-adding the addAction to the object
	sleep 600;
	//the script below also needs to start on the object. Change the _object to "this" without the quotations. The script section of the addAction is where we call this very function we created. The parameters before "spawn" are identities that will be carried into the spawned script. The "condition" section of the addAction we set in this way, so only someone with the role "Engineer" can interact with this addAction. If you want to add multiple, you can put OR at the end of each statement or ||
	_object addAction ["Fortify Barriers", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, _caller, _actionId] spawn FON_fnc_CustomBarriers;}, nil, 3, false, true, "", "(roleDescription _this) isEqualTo 'Engineer'", 5, false, "", ""];
};



//Use this version for the ACE Self Interact version
FON_fnc_CustomTurretsSelf = {
	[[east, 850, [["RHS_AGS30_TriPod_MSV", 75],
				["rhs_KORD_MSV", 30],
				["rhs_KORD_high_MSV", 30],
				["rhs_SPG9M_MSV", 125]
				]], ace_fortify_fnc_registerObjects] remoteExec ["call", 2];

	["Turret Fortifications Available"] remoteExec ["hint", 0];
};

//Use this version for the addAction on object
FON_fnc_CustomTurrets = {
	params ["_object","_caller", "_ID"];
	_object removeAction _ID;
	
	[[east, 850, [["RHS_AGS30_TriPod_MSV", 75],
				["rhs_KORD_MSV", 30],
				["rhs_KORD_high_MSV", 30],
				["rhs_SPG9M_MSV", 125]
				]], ace_fortify_fnc_registerObjects] remoteExec ["call", 2];

	["Turret Fortifications Available"] remoteExec ["hint", 0];

	sleep 600;
	
	_object addAction ["Fortify Turrets", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, _caller, _actionId] spawn FON_fnc_CustomTurrets;}, nil, 3, false, true, "", "(roleDescription _this) isEqualTo 'Engineer'", 5, false, "", ""];
};



//Use this version for the ACE Self Interact version
FON_fnc_CustomStructuresSelf = {
	[[east, 850, [["Land_BagBunker_Small_F", 110],
				["Land_BagBunker_Large_F", 135],
				["Land_HBarrierTower_F", 85],
				["Land_Cargo_Patrol_V2_F", 90]]], ace_fortify_fnc_registerObjects] remoteExec ["call", 2];
	
	["Structure Fortifications Available"] remoteExec ["hint", 0];
};

//Use this version for the addAction on object
FON_fnc_CustomStructures = {
	params ["_object","_caller", "_ID"];
	_object removeAction _ID;
	
	[[east, 850, [["Land_BagBunker_Small_F", 110],
				["Land_BagBunker_Large_F", 135],
				["Land_HBarrierTower_F", 85],
				["Land_Cargo_Patrol_V2_F", 90]]], ace_fortify_fnc_registerObjects] remoteExec ["call", 2];
	
	["Structure Fortifications Available"] remoteExec ["hint", 0];

	sleep 600;
	
	_object addAction ["Fortify Structures", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, _caller, _actionId] spawn FON_fnc_CustomStructures;}, nil, 3, false, true, "", "(roleDescription _this) isEqualTo 'Engineer'", 5, false, "", ""];
};