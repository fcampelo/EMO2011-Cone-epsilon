
function flag = check_box_dominance(b1,b2)
% Towards a Quick Computation of Well-Spread Pareto-Optimal Solutions
% Kalyanmoy Deb, Manikanth Mohan, and Shikhar Mishra
% C.M. Fonseca et al. (Eds.): EMO 2003, LNCS 2632, pp. 222–236, 2003
% Springer-Verlag Berlin Heidelberg 2003
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Verica a relação eps-dominância

% flag = 1: b(y1) domina b(y2)
% flag = 2: b(y2) domina b(y1)
% flag = 3: b(y1) e b(y2) são não-dominados entre si e b(y1)!=b(y2)
% flag = 4: b(y1) e b(y2) são não-dominados entre si e b(y1)=b(y2)

b = [b1 b2];

if ( b(:,1)<=b(:,2) & sum(b(:,1)~=b(:,2))>0 )
    flag = 1;    
elseif ( b(:,2)<=b(:,1) & sum(b(:,2)~=b(:,1))>0 )
    flag = 2;
elseif ( sum(b(:,1)~=b(:,2))>0 )    
    flag = 3;
else
    flag = 4;
end
