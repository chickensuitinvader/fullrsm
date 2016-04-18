%% Perform tests on the fullRSM

clear variables
close all
%% fullupdate Tests

% Test 1: Phase 2, 2 by 2
input = struct('m',2,'c',[-3;-2;1;0;0],'s',1,'r',1,'BinvAs',...
            [2;0],'phase1',0,'varstatus',[0;0;0;1;2],'basicvars',[4;5],...
            'cB',[0;0],'Binv',[1,0;0,1],'xB',[6;3]);
output = fullRSMTestFn('fullupdate',input);
if output.success == 1
success = [prod(output.content{1} == [1;0;0;0;2]), ...
            prod(output.content{2} == [1;5]), ...
            prod(output.content{3} == [-3;0]), ...
            prod(output.content{4} == [0.5,0;0,1]), ...
            prod(output.content{5} == [3;3])];
else 
    success = 0;
end
if prod(success) == 0
    disp('Failure in Test 1: Phase 2 2x2 fullupdate');
else
    disp('Test 1 Pass: Phase 2 2x2 fullupdate');
end

% Test 2: Phase 1, 3 by 3
input = struct('m',3,'c',[0;0;0;0;0],'s',2,'r',2,'BinvAs',...
            [1;1;1],'phase1',1,'varstatus',[0;0;0;0;3],'basicvars',[6;7;5],...
            'cB',[1;1;0],'Binv',[1,0,0;0,1,0;0,0,1],'xB',[2;1;3]);
output = fullRSMTestFn('fullupdate',input);
if output.success == 1
success = [prod(output.content{1} == [0;2;0;0;3]), ...
            prod(output.content{2} == [6;2;5]), ...
            prod(output.content{3} == [1;0;0]), ...
            prod(output.content{4} == [1,-1,0;0,1,0;0,-1,1]), ...
            prod(output.content{5} == [1;1;2])];
else
    success = 0;
end
if prod(success) == 0
    disp('Failure in Test 2: Phase 1 3x3 fullupdate');
else
    disp('Test 2 Pass: Phase 1 3x3 fullupdate');
end