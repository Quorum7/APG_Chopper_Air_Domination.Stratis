if (isServer or !isMultiplayer) then { // only the server has the right to do anything with these variables


// Count units inside sector's radius
sector1_blufor = {side _x == WEST and _x distance sector1 <= 20} count allUnits;
sector2_blufor = {side _x == WEST and _x distance sector2 <= 75} count allUnits;
sector3_blufor = {side _x == WEST and _x distance sector3 <= 50} count allUnits;

sector1_opfor = {side _x == EAST and _x distance sector1 <= 20} count allUnits;
sector2_opfor = {side _x == EAST and _x distance sector2 <= 75} count allUnits;
sector3_opfor = {side _x == EAST and _x distance sector3 <= 50} count allUnits;


sector1_unitStatus = (sector1_blufor - sector1_opfor);
sector2_unitStatus = (sector2_blufor - sector2_opfor);
sector3_unitStatus = (sector3_blufor - sector3_opfor);

sector1_capture = (sector1_capture - sector1_unitStatus);
sector2_capture = (sector2_capture - sector2_unitStatus);
sector3_capture = (sector3_capture - sector3_unitStatus);


// Limit capture value so it doesn't exceed 30 or drops below 0
if (sector1_capture >= maxCaptureTime) then {sector1_capture = maxCaptureTime};
if (sector1_capture <= 0) then {sector1_capture = 0};
if (sector2_capture >= maxCaptureTime) then {sector2_capture = maxCaptureTime};
if (sector2_capture <= 0) then {sector2_capture = 0};
if (sector3_capture >= maxCaptureTime) then {sector3_capture = maxCaptureTime};
if (sector3_capture <= 0) then {sector3_capture = 0};


// This is needed because we don't want to change maxMissionTime but we want to have minutes/seconds for the monitor
timeUntilEnd = maxMissionTime; 


// This is to change time unit for the monitor
if (maxMissionTime > 60) then {timeUnit = "Minutes"; timeUntilEnd = ceil (maxMissionTime / 60)} else {timeUnit = "Seconds"; timeUntilEnd = maxMissionTime};

maxMissionTime = maxMissionTime - 1;


// Reduce recap timer if all sectors are captured by BLUFOR
if (sector1owner == 2 and sector2owner == 2 and sector3owner == 2) then { recapTimer = recapTimer - 1; };


// Send the variables to all clients
publicVariable "timeUnit";
publicVariable "sector1_blufor";
publicVariable "sector2_blufor";
publicVariable "sector3_blufor";
publicVariable "sector1_opfor";
publicVariable "sector2_opfor";
publicVariable "sector3_opfor";
publicVariable "sector1_capture";
publicVariable "sector2_capture";
publicVariable "sector3_capture";
publicVariable "timeUntilEnd";
publicVariable "maxMissionTime";
publicVariable "sector1owner";
publicVariable "sector2owner";
publicVariable "sector3owner";
publicVariable "recapTimer";
};


// Change sector owner
if (sector1_capture == maxCaptureTime) then {"sector1" setMarkerColor "ColorRed"; sector1status = "Belongs to OPFOR"; sector1owner = 1; };
if (sector2_capture == maxCaptureTime) then {"sector2" setMarkerColor "ColorRed"; sector2status = "Belongs to OPFOR"; sector2owner = 1; };
if (sector3_capture == maxCaptureTime) then {"sector3" setMarkerColor "ColorRed"; sector3status = "Belongs to OPFOR"; sector3owner = 1; };


if (sector1_capture == 0) then {"sector1" setMarkerColor "ColorBlue"; sector1status = "Belongs to BLUFOR"; sector1owner = 2; sector1attack setTaskState "Succeeded"; sector1defend setTaskState "Failed"; };
if (sector2_capture == 0) then {"sector2" setMarkerColor "ColorBlue"; sector2status = "Belongs to BLUFOR"; sector2owner = 2; sector2attack setTaskState "Succeeded"; sector2defend setTaskState "Failed"; };
if (sector3_capture == 0) then {"sector3" setMarkerColor "ColorBlue"; sector3status = "Belongs to BLUFOR"; sector3owner = 2; sector3attack setTaskState "Succeeded"; sector3defend setTaskState "Failed"; };

if (maxMissionTime <= 0) then
{
	if (sector1owner == 1 and sector2owner == 1 and sector3owner == 1) then
	{
		endMission "END3"
	};
	if (sector1owner == 2 and sector2owner == 2 and sector3owner == 2) then
	{
		endMission "END1"
	};
};
if (recapTimer <= 0) then
{
	endMission "END2"
};
	

// The monitor
hintSilent format ["Sector 1 Status: %1, %2 \n Sector 2 Status: %3, %4 \n Sector 3 Status: %5, %6 \n %7 seconds to recap \n %8 %9 until mission ends", sector1_capture, sector1status, sector2_capture, sector2status, sector3_capture, sector3status, recapTimer, timeUntilEnd, timeUnit];
