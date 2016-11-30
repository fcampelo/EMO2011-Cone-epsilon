
function [F,jF] = fast_nondominated_sort(P,jP)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Determina o conjunto de fronteiras não-dominadas
i = 1;
while ( ~isempty(jP) )
    [jF(i).front,jFi] = find_nondominated_front(jP);    
    F(i).front = P(:,jFi);    
    jP(:,jFi) = [];
    P(:,jFi) = [];    
    i = i + 1;
end
