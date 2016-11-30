
function [A,jA] = nsgaii(fun)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% (i)  : NSGA II - Codificação Real
% (ii) : Simulated Binary Crossover (SBX)
% (iii): Polynomial Mutation (PM)
%
% Exemplos: [A,jA] = nsgaii(@deb52)
%           [A,jA] = nsgaii(@dtlz2)
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

%% Carrega os dados do problema de otimização
[limites,NEFmax] = constantes(fun);
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

%% A população é ordenada com base na não-dominância
[F,jF] = fast_nondominated_sort(P,jP);

%% Armazena a população de memória
A(g).mem  = F(1).front;
jA(g).mem = jF(1).front;

%% Seleção por torneio binário
S = binary_tournament_selection(F);

%% Cruzamento binário simulado
Q = simulated_binary_crossover(S,px,ni_x,ub,lb);

%% Mutação polinomial
Q = polynomial_mutation(Q,pm,ni_m,ub,lb);

%% Avaliação das novas soluções geradas
jQ  = get_fitness(fun,Q);
NEF = NEF + np;


%% Ciclo iterativo
while (NEF <= NEFmax)
    
    % Combina as populações P e Q
    R  = [P Q];
    jR = [jP jQ];
    
    % A população combinada é ordenada com base na não-dominância
    [F,jF] = fast_nondominated_sort(R,jR);
        
    % Aplica a métrica "crowding distance" à primeira fronteira
    Idist = crowding_distance_assignment(jF(1).front);
        
    % Armazena a população de memória
    [~,jIdist] = sort(Idist,2,'descend');
    t = size(F(1).front,2);        
    A(g+1).mem  = F(1).front(:,jIdist(1:min(t,100)));
    jA(g+1).mem = jF(1).front(:,jIdist(1:min(t,100)));
        
    % Plota a estimação atual da fronteira Pareto   
    if (size(jR,1) == 2)
        plot(jA(g+1).mem(1,:), jA(g+1).mem(2,:), 'ro')    
        xlabel('f1'), ylabel('f2')
    else
        plot3(jA(g+1).mem(1,:), jA(g+1).mem(2,:), jA(g+1).mem(3,:), 'ro')
        xlabel('f1'), ylabel('f2'), zlabel('f3')
    end
    grid on
    pause(0.1)    
    
    % Avalia a condição de parada
    if (NEF == NEFmax)        
        return
    end
    
    % Seleciona a nova população
    P  = [];
    jP = [];
    irank = [];
    crowd = [];
    
    i  = 1;    
    while ( size(P,2) + t <= np )        
        
        P  = [P F(i).front];
        jP = [jP jF(i).front];
        irank = [irank i*ones(1,t)]; 
        crowd = [crowd Idist];
        
        i = i + 1;
        t = size(F(i).front,2);
        
        % Aplica a métrica de distância "crowding distance"
        Idist = crowding_distance_assignment(jF(i).front);        
    end
    
    s = size(P,2);
    if (s ~= np)                 
        % Ordena as soluções em jF(i).front com base no "crowding dist."
        [K,jK,Idist] = crowded_comparison_operator(F(i).front,jF(i).front,Idist);
        
        % Completa a nova população
        P  = [P K(:,1:(np-s))];
        jP = [jP jK(:,1:(np-s))];
        irank = [irank i*ones(1,np-s)];
        crowd = [crowd Idist(1:np-s)];
    end
    
    % Seleção por torneio binário
    S = binary_tournament_selection(P,irank,crowd);
    
    % Cruzamento binário simulado
    Q = simulated_binary_crossover(S,px,ni_x,ub,lb);
    
    % Mutação polinomial
    Q = polynomial_mutation(Q,pm,ni_m,ub,lb);
        
    % Avalia as novas soluções geradas
    jQ  = get_fitness(fun,Q);
    NEF = NEF + np;
    
    % Atualiza o contador de gerações
    g = g + 1;   
end

