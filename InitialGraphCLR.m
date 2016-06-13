function A = InitialGraphCLR(data, m, issymmetric)
%% 
% by Lance, May 2016
% Learning An Initial Graph
% ref: Nie, Feiping, et al. "The Constrained Laplacian Rank Algorithm for Graph-Based Clustering." (2016).
%%
n = size(data,2);
E = pdist2(data', data').^2;

[SortedE, Ind] = sort(E); SortedE = SortedE'; Ind = Ind';
SortedE = [SortedE(:,2:end),SortedE(:,1)]; Ind = [Ind(:,2:end),Ind(:,1)];
Eim1 = repmat(SortedE(:,m+1),[1,n]); 
Eim1Ind = Ind(:,m+1);

%*****
%make a Indicator Mask to record j<=m or j>m
IndMask = zeros(n); 
for i = 1:n
    IndMask(i, Ind(i,1:m)) = 1;
end

E_numerator = E.*IndMask;
Eim1_numerator = Eim1.*IndMask;

denominator = m*Eim1 - repmat(sum(SortedE(:,1:m),2),[1,n]) + eps;
A = (Eim1_numerator - E_numerator)./denominator;

if issymmetric == 1
    A = (A+A')/2;
end;
    