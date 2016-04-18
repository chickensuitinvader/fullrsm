function [result,z,x,pi] = fullrsm(m,n,c,A,b)
% Solves a linear program using Gauss-Jordon updates
% Assumes standard computational form
% Performs a Phase I procedure starting from an artificial basis
% Input:
%   m,n       = number of constraints and variables
%   c         = nx1 cost vector
%   A         = mxn constraint matrix
%   b         = mx1 rhs vector
% Output:
%   result    = 1 if problem optimal, 0 if infeasible, -1 if unbounded
%   z         = objective function value
%   x         = nx1 solution vector
%   pi        = mx1 dual vector

% Phase I
phaseOne = true;
varstatus = [zeros(n,1) ones(m,1)];
Binv = eye(m);
for i = 1:m
	[s,minrc] = fullfindEV(n,c,A,varstatus,pi,phaseOne);
	



end