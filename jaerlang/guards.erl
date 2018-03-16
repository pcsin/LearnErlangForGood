-module(guards).
-compile(export_all).

is_even(X) ->
    case X rem 2 of
        0 -> true;
        1 -> false
    end.

filter([], _) ->
    [];
filter([H|T], P) ->
    case P(H) of
        true -> [H|filter(T, P)];
        false -> filter(T, P)
    end.
