
function [F,jF,Idist] = crowded_comparison_operator(F,jF,Idist)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia El�trica
% Lucas de Souza Batista
%

%% Ordenas as solu��es em F com base na m�trica de dist�ncia
[Idist,jIdist] = sort(Idist,2,'descend');
F  = F(:,jIdist);
jF = jF(:,jIdist);
