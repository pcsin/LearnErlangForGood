-module(recursion).
-compile([export_all, {no_auto_import, [length/1]}]).

%% routine to calculate factorial.
factorial(0) ->
    1;
factorial(N) when is_number(N) ; N > 0 ->
    N * factorial (N - 1);
factorial(_) ->
    incorrect_input.


%% routine to calculate the length of a list
length ([]) ->
    0;
length ([_|T]) ->
    1 + length (T).

%% Tail recursion.
%% To have a function call to be tail recursive; it must be 'alone'.
%% Tail recursion aims at eliminating the stacking of operations as it happens.
tail_factorial (N) ->
    tail_factorial(N, 1).

tail_factorial (0, Acc) ->
    Acc;
tail_factorial (N, Acc) when N > 0 ->
    tail_factorial (N - 1, N * Acc).

tail_len (L) ->
    tail_len (L, 0).

tail_len ([], Acc) ->
    Acc;
tail_len ([_|T], Acc) ->
    tail_len (T, 1 + Acc).

%% routine to duplicate a given term N times.
duplicate (Term, N) ->
    duplicate (Term, N, []).

duplicate (_, 0, Acc) ->
    Acc;
duplicate (Term, N, Acc) ->
    duplicate (Term, N - 1, [Term | Acc]).

%% routing to reverse a list of items. (Tail recursively)
reverse (L) ->
    reverse (L, []).

reverse ([], Acc) ->
    Acc;
reverse ([H|T], Acc) ->
    reverse (T, [H | Acc]).

%% routine to return a sublist of a list.
sublist (L, N) ->
    sublist (L, N, []).

sublist (_, 0, Acc) ->
    Acc;
sublist ([], _, Acc) ->
    Acc;
sublist ([H|T], N, Acc) ->
    sublist (T, N - 1, [H | Acc]).

zip (L1, L2) ->
    zip (L1, L2, []).

zip ([], _, Acc) ->
    reverse (Acc);
zip (_, [], Acc) ->
    reverse (Acc);
zip ([H1|T1], [H2|T2], Acc) ->
    zip (T1, T2, [{H1, H2} | Acc]).