-module(doors).
-export([doors/1]).

toggle(0) -> 1;
toggle(1) -> 0.

doors(L) ->
    doors(L, 1, L).

doors([], _, Acc) ->
    Acc;
doors(L, Itr, Acc) ->
    Doors = my_map(Acc, fun(X, I) -> case I rem Itr =:= 0 of true -> toggle(X); false -> X end end),
    doors(tl(L), Itr + 1, Doors).

my_map(L, F) ->
    my_map(L, F, 1).

my_map([], _, _) ->
    [];
my_map([H|T], F, Ptr) ->
    [F(H, Ptr) | my_map(T, F, Ptr + 1)].

