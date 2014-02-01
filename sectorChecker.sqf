
// This script is ran through a game logic object in editor


// Check if mission parameters are undefined (this is for JIP players who get the variables upon joining so that they don't overwrite server's values)
if (isNil "recapTime") then 
{
	if (!isMultiplayer) then 
	{
		recapTime = 300; // For singleplayer
	}
	else
	{
		recapTime = paramsArray select 0;
	};
};

if (isNil "maxCaptureTime") then 
{
	if (!isMultiplayer) then 
	{
		maxCaptureTime = 30;
	}
	else
	{
		maxCaptureTime = paramsArray select 1;
	};
};

if (isNil "maxMissionTime") then 
{
	if (!isMultiplayer) then 
	{
		maxMissionTime = 30*60;
	}
	else
	{
		maxMissionTime = (paramsArray select 2)*60;
	};
};


// Set parameters
recapTimer = recapTime; 
sector1_capture = maxCaptureTime; 
sector2_capture = maxCaptureTime; 
sector3_capture = maxCaptureTime; 


// AFAIK the variables need to be initialized before they are used later in ifs and stuff
sector1_unitStatus = 0;
sector2_unitStatus = 0;
sector3_unitStatus = 0;


// Run updateSectorControl.sqf every second
while {true} do { 
nul = execVM "updateSectorControl.sqf";
sleep 1;
};