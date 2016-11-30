
function flag = check_dominance(y1,y2)

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
