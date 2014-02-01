_pos = _this select 0;
while {true} do
{
  _smoke="SmokeShell" createVehicle [getPos _pos select 0,getPos _pos select 1, 0.2];
  sleep 20;
};