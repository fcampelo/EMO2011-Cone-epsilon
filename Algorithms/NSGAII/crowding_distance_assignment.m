
function Idist = crowding_distance_assignment(I)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Determina a proximidade entre soluções usando uma métrica de distância
[nobj,npt]   = size(I);
Idist(1:npt) = 0;

for m = 1:nobj    
    [J,Ji] = sort(I(m,:));
    
    Idist(Ji(1))   = inf;
    Idist(Ji(end)) = inf;
    
    delta = max(J(end)-J(1),1E-10);
    
    for i = 2:npt-1        
        Idist(Ji(i)) = Idist(Ji(i)) + (J(i+1) - J(i-1))/delta;
    end
end
