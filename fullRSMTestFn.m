% Test Function
function output = fullRSMTestFn (testType, input)
% This function will test specific functions of the fullrsm method to allow
% for checking
% Input:    testType:   string representing the function to test
%           input:      struct of input     (optional)
% Output:   output:     struct of output

output = struct('success',0,'message','','content',cell(1));

if (nargin ~= 2)
    output.message = 'error in argument number';
    return;
end

% fullupdate check
if strcmp(testType,'fullupdate')
    % check input
    check = isfield(input,{'m','c','s','r','BinvAs','phase1','varstatus',...
        'basicvars','cB','Binv','xB'});
    if prod(check) == 0
        output.message = 'error in input struct';
        return
    end
    
    % perform function
    try
    [vS,bV,cB,Bi,xB] = ...
        fullupdate(input.m,input.c,input.s,input.r,input.BinvAs,...
        input.phase1,input.varstatus,input.basicvars,input.cB,input.Binv,...
        input.xB);
    catch Exception
        output.message = 'error in fullupdate function';
        output.content = Exception;
        return
    end
    output.content = {vS,bV,cB,Bi,xB};
    output.message = 'Test Complete';
    output.success = 1;    
end % if(fullupdate)

end % function