-module(lets_start_again).
-compile(export_all).

hello(Name) ->
    io: format("Hello ~s~n", [Name]).

sample_process() ->
    receive
        {_, Message} ->
            io: format("sent this message ~s~n", [Message])
    end.

start() ->
    spawn(lets_start_again, sample_process, []).

%% Let's revisit some recursion in erlang%%
factorial(N) ->
    factorial(N, 1).

factorial(0, Acc) ->
    Acc;
factorial(N, Acc) ->
    factorial(N - 1, N * Acc).

gcd(A, 0) ->
    A;
gcd(A, B) ->
    gcd(B, A rem B).