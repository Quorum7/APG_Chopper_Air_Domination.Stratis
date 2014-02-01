skiptime (((paramsarray select 3) - daytime + 24) % 24);
switch (paramsarray select 4) do 
	{
		case 1: { 0 setOvercast 0; 0 setRain 0 };
		case 2: { 0 setOvercast 1; 0 setRain 1 };
		case 3: { 0 setOvercast 0.7; 0 setRain 0 };
	};
switch (paramsarray select 5) do 
	{
		case 1: { 0 setFog 0 };
		case 2: { 0 setFog 0.25 };
		case 3: { 0 setFog 0.5 };
		case 4: { 0 setFog 0.8 };
	};
switch (paramsarray select 1) do 
	{
		case 10: {[west,10] call BIS_fnc_respawnTickets};
		case 20: {[west,20] call BIS_fnc_respawnTickets};
		case 30: {[west,30] call BIS_fnc_respawnTickets};
		case 40: {[west,40] call BIS_fnc_respawnTickets};
		case 50: {[west,50] call BIS_fnc_respawnTickets};
		case 60: {[west,60] call BIS_fnc_respawnTickets};
		case 70: {[west,70] call BIS_fnc_respawnTickets};
		case 80: {[west,80] call BIS_fnc_respawnTickets};
		case 90: {[west,90] call BIS_fnc_respawnTickets};
		case 100: {[west,100] call BIS_fnc_respawnTickets};
	};
switch (paramsarray select 2) do 
	{
		case 10: {[east,10] call BIS_fnc_respawnTickets};
		case 20: {[east,20] call BIS_fnc_respawnTickets};
		case 30: {[east,30] call BIS_fnc_respawnTickets};
		case 40: {[east,40] call BIS_fnc_respawnTickets};
		case 50: {[east,50] call BIS_fnc_respawnTickets};
		case 60: {[east,60] call BIS_fnc_respawnTickets};
		case 70: {[east,70] call BIS_fnc_respawnTickets};
		case 80: {[east,80] call BIS_fnc_respawnTickets};
		case 90: {[east,90] call BIS_fnc_respawnTickets};
		case 100: {[east,100] call BIS_fnc_respawnTickets};
	};
switch (paramsarray select 7) do 
	{
		case 1: {TicketInspector = false};
		case 2: {TicketInspector = true};
	};
switch (paramsarray select 6) do 
	{
		case 1: {TicketCounter = true};
		case 2: {TicketCounter = false};
	};
[] execVM "tickets.sqf";
[] execVM "TicketCounter.sqf";