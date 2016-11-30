
function [A,jA] = nsgaii(fun)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% (i)  : NSGA II - Codifica��o Real
% (ii) : Simulated Binary Crossover (SBX)
% (iii): Polynomial Mutation (PM)
%
% Exemplos: [A,jA] = nsgaii(@deb52)
%           [A,jA] = nsgaii(@dtlz2)
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

%% Carrega os dados do problema de otimiza��o
[limites,NEFmax] = constantes(fun);
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

%% A popula��o � ordenada com base na n�o-domin�ncia
[F,jF] = fast_nondominated_sort(P,jP);

%% Armazena a popula��o de mem�ria
A(g).mem  = F(1).front;
jA(g).mem = jF(1).front;

%% Sele��o por torneio bin�rio
S = binary_tournament_selection(F);

%% Cruzamento bin�rio simulado
Q = simulated_binary_crossover(S,px,ni_x,ub,lb);

%% Muta��o polinomial
Q = polynomial_mutation(Q,pm,ni_m,ub,lb);

%% Avalia��o das novas solu��es geradas
jQ  = get_fitness(fun,Q);
NEF = NEF + np;


%% Ciclo iterativo
while (NEF <= NEFmax)
    
    % Combina as popula��es P e Q
    R  = [P Q];
    jR = [jP jQ];
    
    % A popula��o combinada � ordenada com base na n�o-domin�ncia
    [F,jF] = fast_nondominated_sort(R,jR);
        
    % Aplica a m�trica "crowding distance" � primeira fronteira
    Idist = crowding_distance_assignment(jF(1).front);
        
    % Armazena a popula��o de mem�ria
    [~,jIdist] = sort(Idist,2,'descend');
    t = size(F(1).front,2);        
    A(g+1).mem  = F(1).front(:,jIdist(1:min(t,100)));
    jA(g+1).mem = jF(1).front(:,jIdist(1:min(t,100)));
        
    % Plota a estima��o atual da fronteira Pareto   
    if (size(jR,1) == 2)
        plot(jA(g+1).mem(1,:), jA(g+1).mem(2,:), 'ro')    
        xlabel('f1'), ylabel('f2')
    else
        plot3(jA(g+1).mem(1,:), jA(g+1).mem(2,:), jA(g+1).mem(3,:), 'ro')
        xlabel('f1'), ylabel('f2'), zlabel('f3')
    end
    grid on
    pause(0.1)    
    
    % Avalia a condi��o de parada
    if (NEF == NEFmax)        
        return
    end
    
    % Seleciona a nova popula��o
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
        
        % Aplica a m�trica de dist�ncia "crowding distance"
        Idist = crowding_distance_assignment(jF(i).front);        
    end
    
    s = size(P,2);
    if (s ~= np)                 
        % Ordena as solu��es em jF(i).front com base no "crowding dist."
        [K,jK,Idist] = crowded_comparison_operator(F(i).front,jF(i).front,Idist);
        
        % Completa a nova popula��o
        P  = [P K(:,1:(np-s))];
        jP = [jP jK(:,1:(np-s))];
        irank = [irank i*ones(1,np-s)];
        crowd = [crowd Idist(1:np-s)];
    end
    
    % Sele��o por torneio bin�rio
    S = binary_tournament_selection(P,irank,crowd);
    
    % Cruzamento bin�rio simulado
    Q = simulated_binary_crossover(S,px,ni_x,ub,lb);
    
    % Muta��o polinomial
    Q = polynomial_mutation(Q,pm,ni_m,ub,lb);
        
    % Avalia as novas solu��es geradas
    jQ  = get_fitness(fun,Q);
    NEF = NEF + np;
    
    % Atualiza o contador de gera��es
    g = g + 1;   
end

