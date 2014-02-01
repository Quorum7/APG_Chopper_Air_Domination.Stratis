//If Tickets East = 0 fail mission for East
//If Tickets east = 0 fail mission for West      
        while {TicketInspector} do 
			{
				westTickets = [west] call BIS_fnc_respawnTickets;
				eastTickets = [east] call BIS_fnc_respawnTickets;
				sleep 15;
			};