
function [jF,jFi] = find_nondominated_front(jP)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Determina a fronteira não-dominada de jP
np  = size(jP,2);
jF  = jP(:,np);
jFi = np;
jP(:,np) = [];

for i = np-1:-1:1
    p   = jP(:,i);    
    jF  = [jF p];
    jFi = [jFi i];
    jP(:,i) = [];
    
    s = size(jF,2);
    for j = s-1:-1:1                
        q = jF(:,j);        
        if ( p<=q & sum(p~=q)>0 )
            jF(:,j) = [];
            jFi(j)  = [];
        elseif ( q<=p & sum(q~=p)>0 )
            jF(:,end) = [];
            jFi(end)  = [];
            break
        end        
    end
end
