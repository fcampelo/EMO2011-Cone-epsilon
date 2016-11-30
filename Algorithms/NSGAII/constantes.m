
function [limites, NEFmax] = constantes(fun)

%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia El�trica
% Lucas de Souza Batista
%

%% Carrega os dados do problema de otimiza��o

namefun = func2str(fun);
switch lower (namefun)    
    case 'deb52'
        limites = repmat([0 1],1,2);        
        NEFmax  = 20000;      
    case 'dtlz2'   
        limites = repmat([0 1],1,12);        
        NEFmax  = 20000;  
    
    otherwise         
        error('A fun��o especificada n�o est� definida!');
end
