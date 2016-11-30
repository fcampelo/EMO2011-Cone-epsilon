
function flag = check_cone_dominance(y1,b1,y2,b2,K)

%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia El�trica
% Lucas de Souza Batista
%

%% Verica a rela��o cone-domin�ncia

% flag = 1: y1 cone-domina y2
% flag = 2: y2 cone-domina y1
% flag = 3: y1 e y2 s�o cone-n�o-dominados e b(y1)!=b(y2)
% flag = 4: y1 e y2 s�o cone-n�o-dominados e b(y1)=b(y2)

if ( sum(b1~=b2)>0 )    % y1 e y2 est�o em hipercubos distintos
    
    if ( y1<=y2 | linsolve(K,y2-b1)>=0 )
        flag = 1;
    elseif ( y2<=y1 | linsolve(K,y1-b2)>=0 )
        flag = 2;
    else
        flag = 3;
    end
    
else    % y1 e y2 est�o no mesmo hipercubo
    flag = 4;
end

