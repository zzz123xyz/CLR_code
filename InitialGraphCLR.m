function A = InitialGraphCLR(data, m)
%% 
% by Lance, May 2016
% Learning An Initial Graph
% ref: Nie, Feiping, et al. "The Constrained Laplacian Rank Algorithm for Graph-Based Clustering." (2016).
%%
n = size(data,2);
E = pdist2(data', data').^2;

[SortedE, Ind] = sort(E); 

SortedE = SortedE'; Ind = Ind';
SortedE = [SortedE(:,2:end),SortedE(:,1)]; Ind = [Ind(:,2:end),Ind(:,1)];

Eim1 = repmat(SortedE(:,m+1),[1,n]);
denominator = m*Eim1 - repmat(sum(SortedE(:,1:m),2),[1,n]);
A = (Eim1 - SortedE)./denominator;

% j>m aij = 0;
A(:,m+1:end) = 0;
    