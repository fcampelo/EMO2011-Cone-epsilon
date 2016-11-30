
function [limites,epsilon,fmin,NEFmax] = constantes(fun)

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
        epsilon = [0.0031 0.0030]; 
        fmin    = [0 0]';
        NEFmax  = 20000;         
    case 'dtlz2'   
        limites = repmat([0 1],1,12);
        epsilon = [0.06 0.06 0.066]; 
        fmin    = [0 0 0]';
        NEFmax  = 20000;        
        
    otherwise         
        error('A função especificada não está definida!');
end
