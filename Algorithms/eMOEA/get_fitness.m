
function jP = get_fitness(fun,P)

%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia El�trica
% Lucas de Souza Batista
%

%% Obt�m o valor de aptid�o de um conjunto de solu��es candidatas
np = size(P,2);
for i = 1:np
    jP(:,i) = feval(fun,P(:,i));
end
