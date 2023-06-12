#include(Radar.inc)

[top]
components : radarMap genTarget4@TargetGen genTarget1@TargetGen genTarget2@TargetGen genTarget3@TargetGen
link : out@genTarget1 in1@radarMap 
link : out@genTarget2 in2@radarMap
link : out@genTarget3 in3@radarMap
link : out@genTarget4 in4@radarMap

[radarMap]
type : cell
dim : (20, 20, 2)
delay : transport
defaultDelayTime : 100
border : nowrapped
initialValue : 0
localtransition : trackRules

neighbors : radarMap(-2,0,0)  radarMap(2,0,0)  radarMap(0,-2,0) radarMap(0,2,0)
neighbors : radarMap(-1,-1,0) radarMap(-1,0,0) radarMap(-1,1,0) 
neighbors : radarMap(0,-1,0)  radarMap(0,0,0)  radarMap(0,1,0) 
neighbors : radarMap(1,-1,0)  radarMap(1,0,0) radarMap(1,1,0)
neighbors : radarMap(0,0,-1)

in : in1 in2 in3 in4
link : in1 in@radarMap(0,5,0) 
link : in3 in@radarMap(10,0,0)
link : in2 in@radarMap(19,15,0)
link : in4 in@radarMap(13,19,0)
portInTransition : in@radarMap(0,5,0) setTarget1
portInTransition : in@radarMap(10,0,0) setTarget3
portInTransition : in@radarMap(19,15,0) setTarget2
portInTransition : in@radarMap(13,19,0) setTarget4

%Zone for moving targets
zone : targetPlan { (0,0,0)..(19,0,0) (0,1,0)..(19,1,0) (0,2,0)..(19,2,0) (0,3,0)..(19,3,0) (0,4,0)..(19,4,0) } 
zone : targetPlan { (0,5,0)..(19,5,0) (0,6,0)..(19,6,0) (0,7,0)..(19,7,0) (0,8,0)..(19,8,0) (0,9,0)..(19,9,0) }
zone : targetPlan { (0,10,0)..(19,10,0) (0,11,0)..(19,11,0) (0,12,0)..(19,12,0) (0,13,0)..(19,13,0) (0,14,0)..(19,14,0) }
zone : targetPlan { (0,15,0)..(19,15,0) (0,16,0)..(19,16,0) (0,17,0)..(19,17,0) (0,18,0)..(19,18,0) (0,19,0)..(19,19,0) }


%-------------------------------------------------------------------------------
% Radar definition
%--------------------------------------------------------------------------------
[trackRules]
% Most likely movement is straight ahead
%rule : {round((-2,0,0)) + 0.1 } 100 { #Macro(hasAnt) and (fractional((-2,0,0)) > 0 and fractional((-2,0,0)) <= 0.1) }
rule : {round((-1,0,0)) + 0.1 } 100 { #Macro(hasAnt) and (fractional((-1,0,0)) > 0 and fractional((-1,0,0)) <= 0.1) }
%rule : {round((2,0,0))  + 0.2 } 100 { #Macro(hasAnt) and (fractional((2,0,0))  > 0.1 and fractional((2,0,0))  <= 0.2) }
rule : {round((1,0,0))  + 0.2 } 100 { #Macro(hasAnt) and (fractional((1,0,0))  > 0.1 and fractional((1,0,0))  <= 0.2) }
%rule : {round((0,-2,0)) + 0.3 } 100 { #Macro(hasAnt) and (fractional((0,-2,0)) > 0.2 and fractional((0,-2,0)) <= 0.3) }
rule : {round((0,-1,0)) + 0.3 } 100 { #Macro(hasAnt) and (fractional((0,-1,0)) > 0.2 and fractional((0,-1,0)) <= 0.3) }
%rule : {round((0,2,0))  + 0.4 } 100 { #Macro(hasAnt) and (fractional((0,2,0))  > 0.3 and fractional((0,2,0))  <= 0.4) }
rule : {round((0,1,0))  + 0.4 } 100 { #Macro(hasAnt) and (fractional((0,1,0))  > 0.3 and fractional((0,1,0))  <= 0.4) }

% Test for case where we are now going down, but used to be going left (3) or right (4)
%rule : {round((-2,0,0)) + 0.1 } 100 { #Macro(hasAnt) and (fractional((-2,0,0)) > 0.2 and fractional((-2,0,0)) <= 0.4) }
rule : {round((-1,0,0)) + 0.1 } 100 { #Macro(hasAnt) and (fractional((-1,0,0)) > 0.2 and fractional((-1,0,0)) <= 0.4) }
%Test for case where we are now going up, but used to be going left (3) or right (4)
%rule : {round(( 2,0,0)) + 0.2 } 100 { #Macro(hasAnt) and (fractional(( 2,0,0)) > 0.2 and fractional(( 2,0,0)) <= 0.4) }
rule : {round(( 1,0,0)) + 0.2 } 100 { #Macro(hasAnt) and (fractional(( 1,0,0)) > 0.2 and fractional(( 1,0,0)) <= 0.4) }
% Test for case where we are now going left, but used to be going down (1) or up (2)
%rule : {round((0,-2,0)) + 0.3 } 100 { #Macro(hasAnt) and (fractional((0,-2,0)) > 0.0 and fractional((0,-2,0)) <= 0.2) }
rule : {round((0,-1,0)) + 0.3 } 100 { #Macro(hasAnt) and (fractional((0,-1,0)) > 0.0 and fractional((0,-1,0)) <= 0.2) }
% Test for case where we are now going right, but used to be going down (1) or up (2)
%rule : {round((0, 2,0)) + 0.4 } 100 { #Macro(hasAnt) and (fractional((0, 2,0)) > 0.0 and fractional((0, 2,0)) <= 0.2) }
rule : {round((0, 1,0)) + 0.4 } 100 { #Macro(hasAnt) and (fractional((0, 1,0)) > 0.0 and fractional((0, 1,0)) <= 0.2) }

% Test for case where target did not move
rule : {(0,0,0)}                100 { #Macro(hasAnt) and (0,0,0) > 0}

%Rules for creating a new target on the edge of the simulation
rule : {#Macro(newTrack) + 0.4} 100 { #Macro(hasAnt) and (cellPos(1) = 19)}
rule : {#Macro(newTrack) + 0.2} 100 { #Macro(hasAnt) and (cellPos(0) = 19)}
rule : {#Macro(newTrack) + 0.3} 100 { #Macro(hasAnt) and (cellPos(1) = 0)}
rule : {#Macro(newTrack) + 0.1} 100 { #Macro(hasAnt) and (cellPos(0) = 0)}
rule : 0 100 { t }

[setTarget1]
rule : {1} 100 {t}

[setTarget2]
rule : {2} 100 {t}

[setTarget3]
rule : {3} 100 {t}

[setTarget4]
rule : {4} 100 {t}

% Rules for target movement
[targetPlan]
%moving from the top down the grid
rule : {3}        100 {(0,-1,0) = 1 and remainder(cellPos(0)+1, 4)=0}  % move left every fourth row
rule : {0}        100 {(-1,0,0) = 1 and remainder(cellPos(0)+1, 4)=1}  % when moving sideways, clear cell below
rule : {(-1,0,0)} 100 {(-1,0,0) = 1 }  % otherwise move straight down
%moving from the bottom up the grid
rule : {4}       100 {(0,1,0) = 2 and remainder(cellPos(0),5)=1}   % every 3 rows move right
rule : {0}       100 {(1,0,0) = 2 and remainder(cellPos(0),5)=0}  % clear the previous cell
rule : {(1,0,0)} 100 {(1,0,0) = 2 }   % otherwise keep moving up
%moving from left to right
rule : {1}        100 {(-1,0,0) = 3 and remainder(cellPos(1)+1,4) = 0}  % every 4th row move down
rule : {0}        100 {(0,-1,0) = 3 and remainder(cellPos(1)+1,4) = 1}  % clear the previous cell
rule : {(0,-1,0)} 100 {(0,-1,0) = 3 }
%moving from right to left
rule : {2}       100 {(1,0,0) = 4 and remainder(cellPos(1),3)=1}
rule : {0}       100 {(0,1,0) = 4 and remainder(cellPos(1),3)=0}
rule : {(0,1,0)} 100 {(0,1,0) = 4 }

%handling case where two targets want to occupy the same cell - lower number target does not moves
rule : {(0,0,0)} 100 {(-2,0,0) = 1 and (0,0,0) = 2}
rule : {(0,0,0)} 100 {((1,1,0) = 2 or (-1,1,0) = 1) and (0,0,0) = 3}
rule : {(0,0,0)} 100 {((-1,-1,0) = 1 or (1,-1,0) = 2 or (0,-2,0) = 3) and (0,0,0) = 4}

rule : 0 100 {t}

%Input of targets
[genTarget1]
distribution : normal
mean : 2
deviation : 1

[genTarget2]
distribution : normal
mean : 2
deviation : 1

[genTarget3]
distribution : normal
mean : 2
deviation : 1

[genTarget4]
distribution : normal
mean : 2
deviation : 1