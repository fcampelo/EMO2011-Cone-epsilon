
function [A,jA] = coneMOEA(fun)
% Pareto Cone-Dominance: Improving Convergence and Diversity in 
% Multiobjective Evolutionary Algorithms
% Lucas Batista, Felipe Campelo, Frederico Guimar�es, and Jaime Ram�rez
% Paper submetido ao EMO 2011
%
% (i)  : coneMOEA - This is a modification of the eMOEA approach, in which 
%                   we include cone-dominance instead of the regular 
%                   eps-dominance concept.
% (ii) : Simulated Binary Crossover (SBX)
% (iii): Polynomial Mutation (PM)
%
% Exemplos: [A,jA] = coneMOEA(@deb52)
%           [A,jA] = coneMOEA(@dtlz2)
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia El�trica
% Lucas de Souza Batista
%


%% Par�metros do algoritmo
np      = 100;  % Tamanho da popula��o
px      = 1.0;  % Probabilidade de cruzamento
ni_x    = 15;   % �ndice de distribui��o de cruzamento
ni_m    = 20;   % �ndice de distribui��o de muta��o
g       = 1;    % Contador de gera��es
NEF     = 0;    % N�mero de avalia��es na fun��o objetivo
A.mem   = [];   % Arquivo de mem�ria (solu��es candidatas)
jA.mem  = [];   % Arquivo de mem�ria (valores de aptid�o)

% Controla o hipervolume cone-dominado
% h --> 1: cone-domin�ncia converge para eps-domin�ncia
% h --> 0: hipervolume cone-dominado tende a zero
h  = 0.5;

%% Carrega os dados do problema de otimiza��o
[limites,eps,fmin,NEFmax] = constantes(fun);
tL = length(limites);
lb = limites(1:2:tL)';  % Limites inferiores
ub = limites(2:2:tL)';  % Limites superiores
nvar = tL/2;            % Dimens�o do problema (n�mero de vari�veis)

% Probabilidade de muta��o
pm = 1/nvar;

%% Gera��o da popula��o inicial aleatoriamente
P = rand(nvar,np);
for i = 1:nvar
    P(i,:) = (ub(i)-lb(i))*P(i,:) + lb(i)*ones(1,np);
end

%% Avalia��o da popula��o inicial
jP  = get_fitness(fun,P);
NEF = NEF + np;

%% Determina o vetor de �ndices do hipercubo
boxP = box(jP,eps,fmin);

%% Matriz cone-domin�ncia
m = size(jP,1);
K = ((1-h)*(ones(m) - eye(m)) .* repmat(eps(:),1,m)) + diag(eps);

%% Atualiza a popula��o de mem�ria usando cone-domin�nica
Ax   = [];
jAx  = [];
boxA = [];
for i = 1:np        
    [Ax,jAx,boxA] = updade_archive(Ax,jAx,boxA,P(:,i),jP(:,i),boxP(:,i),K);
end
A(g).mem  = Ax;
jA(g).mem = jAx;


%% Ciclo iterativo
while (NEF <= NEFmax)
    
    % Sele��o na popula��o (por torneio bin�rio)
    p1 = binary_tournament_selection(P,jP);
    
    % Sele��o na elite (escolha aleat�ria)         
    s  = size(Ax,2);
    p2 = Ax(:,round((s-1)*rand(1)+1));      
    
    % Cruzamento bin�rio simulado
    Q = simulated_binary_crossover([p1 p2],px,ni_x,ub,lb);
    
    % Muta��o polinomial
    Q = polynomial_mutation(Q,pm,ni_m,ub,lb);
    
    % Avalia��o das novas solu��es geradas
    jQ  = get_fitness(fun,Q);
    NEF = NEF + 2;
    
    % Determina o vetor de �ndices do hipercubo
    boxQ = box(jQ,eps,fmin);
    
    % Atualiza a elite      
    for i = 1:2
        [Ax,jAx,boxA] = updade_archive(Ax,jAx,boxA,Q(:,i),jQ(:,i),boxQ(:,i),K);
    end
    
    % Atualiza a popula��o evolutiva    
    for i = 1:2
        [P,jP] = updade_pop(P,jP,Q(:,i),jQ(:,i));
    end
    
    % Considera��es finais
    if (mod(NEF,100) == 0)
        % Atualiza o contador de gera��es
        g = g + 1;
        
        % Armazena a popula��o de mem�ria
        A(g).mem  = Ax;
        jA(g).mem = jAx;
        
        % Plota a estima��o atual da fronteira Pareto
        if (size(jAx,1) == 2)
            plot(jAx(1,:),jAx(2,:),'ro')
            xlabel('f1'), ylabel('f2')
        else
            plot3(jAx(1,:),jAx(2,:),jAx(3,:),'ro')
            xlabel('f1'), ylabel('f2'), zlabel('f3')
        end
        grid on
        pause(0.1)
                        
        % Avalia a condi��o de parada
        if (NEF == NEFmax)                
            return
        end        
    end       
end

