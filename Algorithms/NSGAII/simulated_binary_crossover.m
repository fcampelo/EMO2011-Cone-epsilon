
function Q = simulated_binary_crossover(P,px,ni_x,ub,lb)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% "Simulated Binary Crossover (SBX)"


% -------------------------------------------------------------------------
% Versão "by Deb": vetorizada (rápida)
% http://www.iitk.ac.in/kangal/codes.shtml
% -------------------------------------------------------------------------
[nvar,np] = size(P);
Q = nan(nvar,np);

beta  = zeros(nvar,1);
alpha = zeros(nvar,1);
betaq = zeros(nvar,1);
c1 = zeros(nvar,1);
c2 = zeros(nvar,1);

for i = 1:2:np    
    
    j = [i i+1];
    
    if (rand(1) <= px)  
        
        if (rand(1) <= 0.5)                    

            t = (rand(nvar,1) <= 0.5) & (abs(P(:,j(1)) - P(:,j(2))) > 1E-14);

            y1 = min([P(:,j(1)) P(:,j(2))],[],2);
            y2 = max([P(:,j(1)) P(:,j(2))],[],2);

            rnd = rand(nvar,1);

            % Determina a solução #01
            beta(t==1)  = 1 + 2*(y1(t==1)-lb(t==1))./(y2(t==1)-y1(t==1));
            alpha(t==1) = 2 - beta(t==1).^(-(ni_x+1));
                        
            k = (rnd<=1./alpha) & (t==1);       
            betaq(k) = (rnd(k).*alpha(k)).^(1/(ni_x+1));

            k = (rnd>1./alpha) & (t==1);
            betaq(k) = (1./(2-rnd(k).*alpha(k))).^(1/(ni_x+1));
            
            c1(t==1) = 0.5*((y1(t==1)+y2(t==1)) - betaq(t==1).*(y2(t==1)-y1(t==1)));
            c1(t==0) = P(t==0,j(1));

            % Determina a solução #02        
            beta(t==1)  = 1 + 2*(ub(t==1)-y2(t==1))./(y2(t==1)-y1(t==1));        
            alpha(t==1) = 2 - beta(t==1).^(-(ni_x+1));

            k = (rnd<=1./alpha) & (t==1);
            betaq(k) = (rnd(k).*alpha(k)).^(1/(ni_x+1));

            k = (rnd>1./alpha) & (t==1);
            betaq(k) = (1./(2-rnd(k).*alpha(k))).^(1/(ni_x+1));     
           
            c2(t==1) = 0.5*((y1(t==1)+y2(t==1)) + betaq(t==1).*(y2(t==1)-y1(t==1)));
            c2(t==0) = P(t==0,j(2));
            
        else
            
            u = rand(nvar,1);    
            betaq(u<=0.5) = (2*u(u<=0.5)).^(1/(ni_x+1));
            betaq(u>0.5)  = (1./(2*(1-u(u>0.5)))).^(1/(ni_x+1));

            c1 = 0.5*( (1+betaq).*P(:,j(1)) + (1-betaq).*P(:,j(2)) );
            c2 = 0.5*( (1-betaq).*P(:,j(1)) + (1+betaq).*P(:,j(2)) );
        end            
            
        % As variáveis são alternadas com probabilidade 0.5
        c = c1;
        r = rand(nvar,1);         
        c1(r<=0.5) = c2(r<=0.5);
        c2(r<=0.5) = c(r<=0.5);        
        
        % Armazena as novas soluções geradas
        Q(:,j(1)) = c1;        
        Q(:,j(2)) = c2;
    else
        Q(:,j(1)) = P(:,j(1));        
        Q(:,j(2)) = P(:,j(2));  
    end
end
Q = reflexao(Q,ub,lb);

