
function [A,jA,boxA] = updade_archive(A,jA,boxA,p,jp,boxp,K)
% Pareto Cone-Dominance: Improving Convergence and Diversity in 
% Multiobjective Evolutionary Algorithms
% Lucas Batista, Felipe Campelo, Frederico Guimarães, and Jaime Ramírez
% Paper submetido ao EMO 2011
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Atualiza a população de memória


s = size(A,2);
samebox = 0;
jworst  = [];

i = 1;
while ( i <= s )

    flag = check_cone_dominance(jp,boxp,jA(:,i),boxA(:,i),K);

    switch flag
        case 1  % jp cone-domina jA(:,i)
            jworst = [jworst i];
            i = i + 1;
            continue 

        case 2  % jA(:,i) cone-domina jp
            return

        case 3  % jp e jA(:,i) são cone-não-dominados e b(jp)!=b(jA(:,i))
            i = i + 1;            
            continue

        case 4  % jp e jA(:,i) são cone-não-dominados e b(jp)=b(jA(:,i))
            flag = check_dominance(jp,jA(:,i));

            switch flag                    
                case -1
                    return
                case 0
                    d1 = sqrt(sum((jp - boxp).^2));
                    d2 = sqrt(sum((jA(:,i) - boxA(:,i)).^2));
                    if (d1>d2)                            
                        return
                    end
            end  
            samebox  = 1;
            jsamebox = i;                
            i = i + 1;
            continue 
    end
end

if (samebox == 0)        
    A    = [A p];
    jA   = [jA jp];
    boxA = [boxA boxp];        
else            
    % jp e jA(:,i) estão no mesmo box e {jp domina jA(:,i)} ou {jp está
    % mais próximo da origem do hipercubo}         
    A(:,jsamebox)    = p;
    jA(:,jsamebox)   = jp;
    boxA(:,jsamebox) = boxp; 
end

A(:,jworst)    = [];
jA(:,jworst)   = [];
boxA(:,jworst) = [];

