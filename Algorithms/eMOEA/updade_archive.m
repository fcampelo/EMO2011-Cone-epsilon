
function [A,jA,boxA] = updade_archive(A,jA,boxA,p,jp,boxp)
% Towards a Quick Computation of Well-Spread Pareto-Optimal Solutions
% Kalyanmoy Deb, Manikanth Mohan, and Shikhar Mishra
% C.M. Fonseca et al. (Eds.): EMO 2003, LNCS 2632, pp. 222–236, 2003
% Springer-Verlag Berlin Heidelberg 2003
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Atualiza a população de memória

s = size(A,2);
choose = 0;

i = 1;
while ( i <= s & choose ~= 1 )
    
    flag = check_box_dominance(boxp,boxA(:,i));
    
    switch flag
        case 1  % jp eps-domina jA(:,i)
            A(:,i)    = [];
            jA(:,i)   = [];
            boxA(:,i) = [];
            s = s - 1;
            continue
        case 2  % jA(:,i) eps-domina jp
            return
        case 3  % jp e jA(:,i) são eps-não-dominados e b(jp) != b(jA(:,i))
            i = i + 1;            
            continue
        case 4  % jp e jA(:,i) são eps-não-dominados e b(jp) = b(jA(:,i))
            choose = 1;
            break
    end
end

if (choose == 0)
    A    = [A p];
    jA   = [jA jp];
    boxA = [boxA boxp];
else    
    if (flag == 4)        
        flag = check_dominance(jp,jA(:,i));
        
        switch flag
            case +1
                A(:,i)    = p;
                jA(:,i)   = jp;
                boxA(:,i) = boxp;
                return
            case -1
                return
            case 0
                d1 = sqrt(sum((jp - boxp).^2));
                d2 = sqrt(sum((jA(:,i) - boxA(:,i)).^2));
                
                if (d1<=d2)
                    A(:,i)    = p;
                    jA(:,i)   = jp;
                    boxA(:,i) = boxp;
                end
                return
        end
    end
end

