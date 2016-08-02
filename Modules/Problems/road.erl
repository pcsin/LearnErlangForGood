-module (road).
-compile (export_all).

reverse (L) ->
    reverse (L, []).

reverse ([], Acc) ->
    Acc;
reverse ([H|T], Acc) ->
    reverse (T, [H|Acc]).

compute ({A, B, X}, {Road, Val}) ->
    case Road of
        0 -> FromA = A + Val, 
             FromB = B + X + Val, 
             if FromA < FromB -> {0, FromA};
                true -> {1, FromB}
             end;
        1 -> FromB = B + Val,
             FromA = A + X + Val,
             if FromB < FromA -> {1, FromB};
                true -> {0, FromA}    
             end        
    end.

%% e.g. input road: road ([{50, 10, 30}, {5, 90, 20}, {40, 2, 25}, {10, 8, 0}])
road (L) ->
    road (reverse(L), {0, 0}).

road ([], T) ->
    T;
road ([H|T], {Road, Val}) ->
    road (T, compute(H, {Road, Val})).
