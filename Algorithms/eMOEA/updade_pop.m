
function [P,jP] = updade_pop(P,jP,p,jp)
% Towards a Quick Computation of Well-Spread Pareto-Optimal Solutions
% Kalyanmoy Deb, Manikanth Mohan, and Shikhar Mishra
% C.M. Fonseca et al. (Eds.): EMO 2003, LNCS 2632, pp. 222–236, 2003
% Springer-Verlag Berlin Heidelberg 2003
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Atualiza a população corrente

s = size(P,2);

for i = 1:s
    flag = check_dominance(jp,jP(:,i));
    
    switch flag
        case +1     % jp domina jP(:,i)
            P(:,i)  = p;
            jP(:,i) = jp;
            return
        case -1     % jP(:,i) domina jp 
            return
        case 0      % jp e jP(:,i) são não-dominados entre si
            continue            
    end
end

i = round((s-1)*rand(1) + 1);
P(:,i)  = p;
jP(:,i) = jp;

