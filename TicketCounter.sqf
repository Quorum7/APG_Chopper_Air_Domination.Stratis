while {TicketCounter} do 
		{
			cutRsc ["TicketProgress","PLAIN",0,false];
			TicketText = "BLUFOR Tickets Remaining: " +str westTickets +"\nOPFOR Tickets Remaining: "+ str eastTickets;
			((uiNamespace getVariable 'hg_hud') displayCtrl -1) ctrlSetText str TicketText;
			sleep 15;
		};
