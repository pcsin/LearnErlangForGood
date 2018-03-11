-module(shop).
-export([my_map/2, my_fold/2, cost/1]).

%% Example usage 
%% shop: my_fold(shop: my_map([{ orange, 1}, { apple, 2}], fun({ What, Q }) -> shop: cost(What) * Q end), fun(Acc, X) -> Acc + X end).

cost(orange) -> 4;
cost(apple) -> 5;
cost(milk) -> 9;
cost(grapes) -> 5.

my_map([], _) ->
    [];
my_map([H|T], F) ->
    [F(H) | my_map(T, F)].

my_fold(L, F) ->
    my_fold(L, F, 0).

my_fold([], _, Acc) ->
    Acc;
my_fold([H|T], F, Acc) ->
    my_fold(T, F, F(Acc, H)).
