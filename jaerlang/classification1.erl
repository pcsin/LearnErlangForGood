-module(classification1).
-export([classify/1]).

classify(N) ->
    DivSums = compute(N),
    classify(DivSums, 1, 0, 0, 0).

classify([], _, Def, Per, Ab) ->
    {Def, Per, Ab};
classify([H|T], Ptr, Def, Per, Ab) when H < Ptr ->
    classify(T, Ptr + 1, Def + 1, Per, Ab);
classify([H|T], Ptr, Def, Per, Ab) when H =:= Ptr ->
    classify(T, Ptr + 1, Def, Per + 1, Ab);
classify([_H|T], Ptr, Def, Per, Ab) ->
    classify(T, Ptr + 1, Def, Per, Ab + 1).


compute(N) ->
    compute(N, []).

compute(0, Acc) ->
    Acc;
compute(N, Acc) ->
    compute(N - 1, [div_sum(N)] ++ Acc).

div_sum(N) ->
    div_sum(N, 1, 0).

div_sum(1, 1, _) ->
    0;
div_sum(N, 1, _) ->
    div_sum(N, 2, 1);
div_sum(N, Start, Acc) when Start * Start > N ->
    Acc;
div_sum(N, Start, Acc) when Start * Start =:= N ->
    div_sum(N, Start + 1, Acc + Start);
div_sum(N, Start, Acc) when N rem Start =:= 0 ->
    div_sum(N, Start + 1, Acc + Start + N div Start);
div_sum(N, Start, Acc) ->
    div_sum(N, Start + 1, Acc).

