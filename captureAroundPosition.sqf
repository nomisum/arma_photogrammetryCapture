params ["_position"];

// freeze scene
{
    _x enableSimulationGlobal false;
} forEach allMissionObjects;


// screenshot around each object
[] spawn { 
    { 
        private _object = _x;   
        private _position = getPos _object;   
     
        if (_object == player) exitwith {};   
     
        for "_i" from 1 to 200 do {   
     
            private _randomPos = [_position#0 + random 10 - 20, _position#1 + random 10 - 20, _position#2 + random 10];  
     
     
            private _cam = "camera" camCreate _randomPos;   
            _cam cameraEffect ["internal", "back"];
            _cam camSetFov 0.75;      
            _cam camSetTarget _object;  
            _cam setPos _randomPos;     
            _cam camCommit 0; waitUntil { camCommitted _cam; };   
    sleep 0.1;  
            screenshot ( 
                str (typeOf _object) + "_photogrammetry_" + str _i + str (getPos _object) + ".png" 
            );   
            sleep 0.1;
            
        };   sleep 1;
    } forEach entities "";  
}; 
 


