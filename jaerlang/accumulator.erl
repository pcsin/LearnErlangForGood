-module(accumulator).
-compile(export_all).

accumulator(Acc) ->
    receive 
        { From, X } -> 
            From ! { self(), X + Acc }
    end,
    accumulator(Acc + X).


foo(X) ->
    Accumulator = spawn(accumulator, accumulator, [X]),
    fun(Y) ->
        Accumulator ! { self(), Y },
        receive
            { Accumulator, V } -> V
        end
    end.