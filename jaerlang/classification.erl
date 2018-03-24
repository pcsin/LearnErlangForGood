-module(classification).
-export([classify/1]).

% This is an O(n^2) solution
% could be improved to O(n^3/2)
classify(N) ->
    DivSum = compute(N),
    classify(DivSum, 1, {deficient, 0}, {perfect, 0}, {abundant, 0}).

classify([], _, Def, Per, Abun) ->
    {Def, Per, Abun};
classify([H|T], Ptr, Def, Per, {abundant, C}) when H > Ptr ->
    classify(T, Ptr + 1, Def, Per, {abundant, C + 1});
classify([H|T], Ptr, {deficient, C}, Per, Abun) when H < Ptr ->
    classify(T, Ptr + 1, {deficient, C + 1}, Per, Abun);
classify([H|T], Ptr, Def, {perfect, C}, Abun) when H =:= Ptr ->
    classify(T, Ptr + 1, Def, {perfect, C + 1}, Abun).

compute(N) ->
    Acc = lists: map(fun(_) -> 0 end, lists: seq(1, N)),
    compute(N, 1, Acc).

compute(N, Start, Acc) when Start > N div 2 ->
    Acc;
compute(N, Start, Acc) ->
    DivSum = my_map(
        fun(X, Ptr) -> 
            case Ptr rem Start =:= 0 andalso Ptr =/= Start of 
                true -> X + Start; 
                false -> X
            end
        end,
        Acc),
    compute(N, Start + 1, DivSum).

my_map(F, L) ->
    my_map(F, L, 1).

my_map(_, [], _) ->
    [];
my_map(F, [H|T], Ptr) ->
    [F(H, Ptr) | my_map(F, T, Ptr + 1)].