
function S = binary_tournament_selection(F,varargin)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% "Binary Tournament Selection"

if ( nargin == 1 ) % F representa uma struct
    
    P = [];
    irank = [];
    crowd = [];
    nstruct = size(F,2);
    for s = 1:nstruct
        P = [P F(s).front];    
        irank = [irank s*ones(1,size(F(s).front,2))];
        crowd = [crowd irank];
    end
    
else % F representa uma matriz    
    
    P = F;    
    irank = varargin{1};
    crowd = varargin{2};
end

[nvar,np] = size(P);

iperm = randperm(np);
P = P(:,iperm);
irank = irank(iperm);
crowd = crowd(iperm);

S = nan(nvar,np);

for i = 1:np
    
    j = round((np-1)*rand(1,2) + 1);
    while (j(1) == j(2))
        j = round((np-1)*rand(1,2) + 1);
    end
    
    if (irank(j(1)) < irank(j(2))) | ...
            ((irank(j(1)) == irank(j(2))) & (crowd(j(1)) > crowd(j(2))))        
        S(:,i)  = P(:,j(1));               
    else
        S(:,i)  = P(:,j(2));       
    end
end
