
function [A,jA] = coneMOEA(fun)
% Pareto Cone-Dominance: Improving Convergence and Diversity in 
% Multiobjective Evolutionary Algorithms
% Lucas Batista, Felipe Campelo, Frederico Guimarães, and Jaime Ramírez
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
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%


%% Parâmetros do algoritmo
np      = 100;  % Tamanho da população
px      = 1.0;  % Probabilidade de cruzamento
ni_x    = 15;   % Índice de distribuição de cruzamento
ni_m    = 20;   % Índice de distribuição de mutação
g       = 1;    % Contador de gerações
NEF     = 0;    % Número de avaliações na função objetivo
A.mem   = [];   % Arquivo de memória (soluções candidatas)
jA.mem  = [];   % Arquivo de memória (valores de aptidão)

% Controla o hipervolume cone-dominado
% h --> 1: cone-dominância converge para eps-dominância
% h --> 0: hipervolume cone-dominado tende a zero
h  = 0.5;

%% Carrega os dados do problema de otimização
[limites,eps,fmin,NEFmax] = constantes(fun);
tL = length(limites);
lb = limites(1:2:tL)';  % Limites inferiores
ub = limites(2:2:tL)';  % Limites superiores
nvar = tL/2;            % Dimensão do problema (número de variáveis)

% Probabilidade de mutação
pm = 1/nvar;

%% Geração da população inicial aleatoriamente
P = rand(nvar,np);
for i = 1:nvar
    P(i,:) = (ub(i)-lb(i))*P(i,:) + lb(i)*ones(1,np);
end

%% Avaliação da população inicial
jP  = get_fitness(fun,P);
NEF = NEF + np;

%% Determina o vetor de índices do hipercubo
boxP = box(jP,eps,fmin);

%% Matriz cone-dominância
m = size(jP,1);
K = ((1-h)*(ones(m) - eye(m)) .* repmat(eps(:),1,m)) + diag(eps);

%% Atualiza a população de memória usando cone-dominânica
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
    
    % Seleção na população (por torneio binário)
    p1 = binary_tournament_selection(P,jP);
    
    % Seleção na elite (escolha aleatória)         
    s  = size(Ax,2);
    p2 = Ax(:,round((s-1)*rand(1)+1));      
    
    % Cruzamento binário simulado
    Q = simulated_binary_crossover([p1 p2],px,ni_x,ub,lb);
    
    % Mutação polinomial
    Q = polynomial_mutation(Q,pm,ni_m,ub,lb);
    
    % Avaliação das novas soluções geradas
    jQ  = get_fitness(fun,Q);
    NEF = NEF + 2;
    
    % Determina o vetor de índices do hipercubo
    boxQ = box(jQ,eps,fmin);
    
    % Atualiza a elite      
    for i = 1:2
        [Ax,jAx,boxA] = updade_archive(Ax,jAx,boxA,Q(:,i),jQ(:,i),boxQ(:,i),K);
    end
    
    % Atualiza a população evolutiva    
    for i = 1:2
        [P,jP] = updade_pop(P,jP,Q(:,i),jQ(:,i));
    end
    
    % Considerações finais
    if (mod(NEF,100) == 0)
        % Atualiza o contador de gerações
        g = g + 1;
        
        % Armazena a população de memória
        A(g).mem  = Ax;
        jA(g).mem = jAx;
        
        % Plota a estimação atual da fronteira Pareto
        if (size(jAx,1) == 2)
            plot(jAx(1,:),jAx(2,:),'ro')
            xlabel('f1'), ylabel('f2')
        else
            plot3(jAx(1,:),jAx(2,:),jAx(3,:),'ro')
            xlabel('f1'), ylabel('f2'), zlabel('f3')
        end
        grid on
        pause(0.1)
                        
        % Avalia a condição de parada
        if (NEF == NEFmax)                
            return
        end        
    end       
end

