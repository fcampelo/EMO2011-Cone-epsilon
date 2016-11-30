
function [limites, NEFmax] = constantes(fun)

%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% Carrega os dados do problema de otimização

namefun = func2str(fun);
switch lower (namefun)    
    case 'deb52'
        limites = repmat([0 1],1,2);        
        NEFmax  = 20000;      
    case 'dtlz2'   
        limites = repmat([0 1],1,12);        
        NEFmax  = 20000;  
    
    otherwise         
        error('A função especificada não está definida!');
end
