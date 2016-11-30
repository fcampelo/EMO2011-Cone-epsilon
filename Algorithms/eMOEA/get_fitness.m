
function jP = get_fitness(fun,P)

%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Obtêm o valor de aptidão de um conjunto de soluções candidatas
np = size(P,2);
for i = 1:np
    jP(:,i) = feval(fun,P(:,i));
end
