
function flag = check_dominance(y1,y2)
% Towards a Quick Computation of Well-Spread Pareto-Optimal Solutions
% Kalyanmoy Deb, Manikanth Mohan, and Shikhar Mishra
% C.M. Fonseca et al. (Eds.): EMO 2003, LNCS 2632, pp. 222–236, 2003
% Springer-Verlag Berlin Heidelberg 2003
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Verica a relação de dominância usual

% flag = +1: y1 domina y2
% flag = -1: y2 domina y1
% flag = 0 : y1 e y2 são não-dominados entre si

if ( y1<=y2 & sum(y1~=y2)>0 )
    flag = +1;    
elseif ( y2<=y1 & sum(y2~=y1)>0 )
    flag = -1;
else
    flag = 0;
end
