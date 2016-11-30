
function P = reflexao(P,ub,lb)

%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Impede a existência de soluções fora da região factível
np = size(P,2);

ub = repmat(ub,1,np);
lb = repmat(lb,1,np);

P(P>ub) = ub(P>ub);
P(P<lb) = lb(P<lb);
