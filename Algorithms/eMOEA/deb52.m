
function [F, varargout] = deb52 (x, varargin)

x = x(:);

%
%   Deb
%           

F1 = 1 - exp(-4*x(1))*(sin(10*pi*x(1)))^4;

g = 1 + x(2)^2;
if (F1<=g)
    h = 1 - (F1/g)^10;
else
    h = 0;
end
F2 = g*h;

F = [F1 F2]';

varargout(1) = {F};
varargout(2) = {0};    
    