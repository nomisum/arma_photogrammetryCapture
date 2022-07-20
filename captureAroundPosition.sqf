params ["_position"];

// freeze scene
{
    _x enableSimulationGlobal false;
} forEach allMissionObjects;


// screenshot around each object
{
    private _object = _x;
    private _position = getPos _object;

    for "_i" from 1 to 200 do {

        private _randomPos = [[_position, 5], [], {}] call BIS_fnc_randomPos;
        private _height = random 5;

        _randomPos set [2, _height];


        private _cam = "internal" camCreate _randomPos;
        _cam cameraEffect ["internal", "back"];
        _cam camCommand "MANUAL ON";
        _cam camSetFov 0.75;
        _cam camSetPos _randomPos;
        _cam camSetTarget _object;
        _cam camCommit 0;

        screenshot ((typeOf _object) + "_photogrammetry_" + _i);
    };
} forEach allMissionObjects;
