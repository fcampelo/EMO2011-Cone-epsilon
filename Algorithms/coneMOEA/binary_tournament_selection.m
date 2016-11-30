
function S = binary_tournament_selection(P,jP)
% Towards a Quick Computation of Well-Spread Pareto-Optimal Solutions
% Kalyanmoy Deb, Manikanth Mohan, and Shikhar Mishra
% C.M. Fonseca et al. (Eds.): EMO 2003, LNCS 2632, pp. 222–236, 2003
% Springer-Verlag Berlin Heidelberg 2003
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% "Binary Tournament Selection"

[nvar,np] = size(P);
S = nan(nvar,1); 

iperm = randperm(np);
P  = P(:,iperm);
jP = jP(:,iperm);
   
j = round((np-1)*rand(1,2) + 1);
while (j(1) == j(2))
    j = round((np-1)*rand(1,2) + 1);
end

flag = check_dominance(jP(:,j(1)),jP(:,j(2)));

if (flag == +1 )
    S = P(:,j(1));
elseif ( flag == -1 )
    S = P(:,j(2));
else
    if (rand(1) <= 0.5)
        S = P(:,j(1));
    else
        S = P(:,j(2));
    end
end    

