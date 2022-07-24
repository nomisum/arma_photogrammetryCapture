params ["_position"];

// freeze scene
{ 
    _x enableSimulationGlobal false; 
    _x hideObjectGlobal true; 
} forEach entities ""; 
 
disableserialization; 
 
 
 
// screenshot around each object 
[] spawn {  
 
     private _cam = "camera" camCreate [0,0,0];    
            _cam cameraEffect ["internal", "back"];    
              
    {  
        private _object = _x;    
        private _position = getPos _object;    
        private _delay = 2; 
        private _timeCapture = time + _delay; 
        _x hideObjectGlobal false; 
      
        if (_object == player) exitwith {};    
      
        for "_i" from 1 to 50 do {    
            private _fileName = "photogrammetry_" + str _i + (typeOf _object) + ".png"; 
        systemchat _fileName; 
            private _randomPos = _object getPos [random 5 min 1, random 360]; 
            _randomPos set [2, random 5 min 0.3];
      
      
            
            _cam campreparepos _randomPos; 
    _cam campreparetarget (_object modeltoworld [0,0,0]); 
    _cam campreparefocus [-1,-1]; 
    _cam campreparefov 0.75; 
    _cam camcommitprepared 0; 
    sleep 0.02; waituntil {time > _timeCapture}; 
             screenshot _fileName;    
             
        };   sleep 1; 
        _x hideObjectGlobal true; 
    } forEach entities "";   
};  
  
 
 
