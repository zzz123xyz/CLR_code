function [y, S, evs, cs] = CLR_main(data, c, m, isrobust, islocal)
%%
% By Lance May 16
% interface to incroprate the CLR algorithm with the graph construction
% stage.

%%

A = InitialGraphCLR(data, m);
[y, S, evs, cs] = CLR(A, c);
