
function [F, varargout] = dtlz2 (x, varargin)

x = x(:);

n = length(x);

s = 0;
for i = 3:n
    s = s + (x(i)-0.5)^2;
end
g = s;

F1 = cos(x(1)*pi/2)*cos(x(2)*pi/2)*(1+g);
F2 = cos(x(1)*pi/2)*sin(x(2)*pi/2)*(1+g);
F3 = sin(x(1)*pi/2)*(1+g);

F = [F1 F2 F3]';

varargout(1) = {F};
varargout(2) = {0};