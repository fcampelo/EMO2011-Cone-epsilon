
function [F, varargout] = pol (x, varargin)

x = x(:);

%
%   Poloni
%           

A1 = 0.5*sin(1) - 2*cos(1) + sin(2) - 1.5*cos(2);
A2 = 1.5*sin(1) - cos(1) + 2*sin(2) - 0.5*cos(2);
B1 = 0.5*sin(x(1)) - 2*cos(x(1)) + sin(x(2)) - 1.5*cos(x(2));
B2 = 1.5*sin(x(1)) - cos(x(1)) + 2*sin(x(2)) - 0.5*cos(x(2));

F1 = 1 + (A1-B1)^2 + (A2-B2)^2;
F2 = (x(1)+3)^2 + (x(2)+1)^2;

F = [F1 F2]';

varargout(1) = {F};
varargout(2) = {0};