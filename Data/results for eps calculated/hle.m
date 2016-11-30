function hl =hle(X,Y)
% Calculates the HodgesÐLehmann estimator of the difference in effects
% between the observation sets X and Y, where X and Y are vectors of size m
% and n, respectively. The HL estimator is calculated as the median on the
% m x n differences (Xi - Yj).

[n1,n2]=size(X);
[m1,m2]=size(Y);
if n1>n2
    X=X';
end
n = numel(X);
if m1<m2
    Y=Y';
end
m = numel(Y);

MX = repmat(X,m,1);
MY = repmat(Y,1,n);
M = MX - MY;
hl=median(median(M));