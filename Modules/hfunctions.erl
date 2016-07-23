-module (hfunctions).
-compile ([export_all, {no_auto_import, [map/2]}]).

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



