This is the original version created by Darihon.
  https://epochmod.com/forum/topic/12375-wiprelease-bank-robbery-v3/
  
  I will modify it later to make it compatible with the single currency.
  
 <b>*** Installation: ***</b><br>
 
  1 - Download the folder.
  2 - open init.sqf and place the line below inside if (isServer) then{           
       
       execVM "rob\bank_building.sqf";
  3 - Open fn_selfaction.sqf an place the line below
    
    _bankrobbery = cursorTarget isKindOf "Notebook";
    if ((speed player <= 1) && _bankrobbery && (player distance cursorTarget < 5)) then {
        if (s_player_bankrob < 0) then {
            s_player_bankrob = player addAction ["Rob the bank","rob\robbank.sqf",cursorTarget, 0, false, true, "",""];
        };
    } else {
       
        player removeAction s_player_bankrob;
		s_player_bankrob = -1;
    };
    
 Done
