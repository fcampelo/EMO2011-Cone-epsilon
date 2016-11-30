
function P = polynomial_mutation(P,pm,ni_m,ub,lb)
% A Fast and Elitist Multi-Objective Genetic Algorithm: NSGA-II
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan
% KanGAL Report no. 200001
%
% Universidade Federal de Minas Gerais
% Departamento de Engenharia Elétrica
% Lucas de Souza Batista
%

%% "Polynomial Mutation"

% -------------------------------------------------------------------------
% Versão "by Deb"
% http://www.iitk.ac.in/kangal/codes.shtml
% -------------------------------------------------------------------------
[nvar,np] = size(P);
delta = zeros(nvar,1);
h = zeros(nvar,1);
p = zeros(nvar,1);

for i = 1:np
    
    if (rand(1) <= pm)
        
        y = P(:,i);
        delta1 = (y-lb)./(ub-lb);
        delta2 = (ub-y)./(ub-lb);
        
        delta_max = max([delta1 delta2],[],2);
               
        r = rand(nvar,1);
        h(r<=0.5) = 1 - delta_max(r<=0.5);
        h(r>0.5)  = 1 - delta_max(r>0.5);
        
        p(r<=0.5) = 2*r(r<=0.5) + (1-2*r(r<=0.5)).*(h(r<=0.5).^(ni_m+1));
        p(r>0.5)  = 2*(1-r(r>0.5)) + 2*(r(r>0.5)-0.5).*(h(r>0.5).^(ni_m+1));
        
        delta(r<=0.5) = p(r<=0.5).^(1/(ni_m+1)) - 1;
        delta(r>0.5)  = 1 - p(r>0.5).^(1/(ni_m+1));
               
        P(:,i) = P(:,i) + (ub - lb).*delta;        
    end
end
P = reflexao(P,ub,lb);

