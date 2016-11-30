
function b = box(jP,eps,fmin)

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
    b(i,:) = floor((jP(i,:) - fmin(i,:))./eps(i)) * eps(i);
end

