function [y, S, evs, cs] = CLR_main(data, c, m, isrobust, islocal)
%%
% By Lance May 16
% interface to incroprate the CLR algorithm with the graph construction
% stage.
% Nie, Feiping, et al. "The Constrained Laplacian Rank Algorithm for Graph-Based Clustering." (2016).

% Input:
%   data: X feature matrix dim: R^{m*n} (m features & n samples)
%   c: number of clusters
%   m: parameters
%
% Output: 
%   S: the output graph

%%
%A = InitialGraphCLR(data, m);
A = constructW_PKN(data, m, 1); %initial graph construction
[y, S, evs, cs] = CLR(A, c);
