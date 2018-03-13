-module(list_comprehensions).
-compile(export_all).

map_using_comp(L, F) ->
    [F(X) || X <- L].

quick_sort([]) ->
    [];
quick_sort([H|T]) ->
    quick_sort([X || X <- T, X < H]) ++ [H] ++ quick_sort([X || X <- T, X >= H]).

seq(_, 0) ->
    [];
seq(S, N) ->
    [S | seq(S + 1, N - 1)].

pythagorean(N) ->
    [{ A, B, C } || A <- seq(1, N), B <- seq(1, N), C <- seq(1, N), A + B > C, A + C > B, B + C > A, A*A + B*B =:= C*C].