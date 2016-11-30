
function b = box(jP,eps,fmin)
% Towards a Quick Computation of Well-Spread Pareto-Optimal Solutions
% Kalyanmoy Deb, Manikanth Mohan, and Shikhar Mishra
% C.M. Fonseca et al. (Eds.): EMO 2003, LNCS 2632, pp. 222�236, 2003
% Springer-Verlag Berlin Heidelberg 2003
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia El�trica
% Lucas de Souza Batista
%

%% Obt�m, para cada solu��o em jP, o vetor de �ndices do hipercubo

[m,np] = size(jP);
fmin = repmat(fmin,1,np);
b = nan(m,np);

for i = 1:m
    b(i,:) = floor((jP(i,:) - fmin(i,:))./eps(i));
end

