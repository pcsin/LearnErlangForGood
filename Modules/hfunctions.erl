-module (hfunctions).
-compile ([export_all, {no_auto_import, [map/2, filter/2]}]).

one () -> 1.
two () -> 2.

add (X, Y) ->
    X () + Y ().

%% mapping a list
map ([], _) -> 
    [];
map ([H|T], F) ->
    [F(H) | map (T, F)].

%% currying example
add_square (X) ->
    fun (Y) -> X*X + Y*Y
    end.

%% filter on list example
filter (L, P) ->
    filter (L, P, []).

filter ([], _, Acc) ->
    Acc;
filter ([H|T], P, Acc) ->
    case P(H) of
        true -> filter (T, P, [H | Acc]);
        false -> filter (T, P, Acc)            
    end.

%% fold example.
fold (L, P) ->
    fold (L, P, undefined).

fold ([], _, Acc) ->
    Acc;
fold ([H|T], P, Acc) ->
    fold (T, P, P(Acc, H)).



