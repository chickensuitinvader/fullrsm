function [varstatus,basicvars,cB,Binv,xB] = fullupdate(m,c,s,r,BinvAs,phase1,varstatus,basicvars,cB,Binv,xB)
% Updates the basis representation.
% Input:
%   m         = number of constraints
%   c         = nx1 cost vector
%   s         = index of entering variable
%   r         = position in the basis of the leaving variable
%   BinvAs    = mx1 Binv*As vector
%   phase1    = boolean, phase1 = true if Phase 1, or false otherwise
%   varstatus = 1xn vector, varstatus(i) = position in basis of variable i,
%               or 0 if variable i is nonbasic
%   basicvars = 1xm vector of indices of basic variables
%   cB        = mx1 basic cost vector
%   Binv      = mxm basis inverse matrix
%   xB        = mx1 basic variable vector
% Output:
%   varstatus = 1xn updated varstatus vector
%   basicvars = 1xm updated basicvars vector
%   cB        = mx1 updated basic cost vector
%   Binv       = mxm updated basis inverse matrix
%   xB        = mx1 updated basic variable vector

% TODO: adapt for extended leaving condition?

% Implementation: Perform a Gauss Jordan Pivot on the matrix [xB , Binv , BinvAs]
% to [xBNew , BinvNew , er]

pivotMatrix = [xB,Binv,BinvAs];

% normalise pivoting row
pivotMatrix(r,:) = pivotMatrix(r,:) / pivotMatrix(r,m+2);

% loop through rows, adding pivoting row multiples to zero out last column
for i = 1:m
    % skips pivot row
    if (i == r) && (i == m)
        break; 
    elseif (i == r)
            i = i+1;
    end
    
    pivotMatrix(i,:) = pivotMatrix(i,:) - pivotMatrix(r,:) * pivotMatrix(i,m+2);
end

% update values
xB = pivotMatrix(:,1);
Binv = pivotMatrix(:,[2:m+1]);
basicvars(r) = s;
varstatus = zeros(length(varstatus),1);
varstatus(basicvars) = find(basicvars);
cB = c(basicvars);
end