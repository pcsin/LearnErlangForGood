-module(aks).
-export([gen_prime/1, is_prime/1]).

gen_prime(N) ->
    lists: filter(fun(X) -> is_prime(X) end, lists: seq(1, N)).

is_prime(N) ->
    AbsCoeffs = iterate(N, [1]),
    Coeffs = aks(coefficients(AbsCoeffs, N, 0, []), N, 0, []),
    check(Coeffs, N, true).

check([], _, true) ->
    true;
check([H|T], N, true) when H rem N =:= 0 ->
    check(T, N, true);
check(_, _, true) ->
    false.

%% compute coeffcients of (x - 1)^N - X^N + 1
aks([], _, _, Acc) ->
    Acc;
aks([H|T], N, 0, Acc) ->
    aks(T, N, 1, Acc ++ [1 + H]);
aks([H|T], N, N, Acc) ->
    aks(T, N, N + 1, Acc ++ [H - 1]);
aks([H|T], N, Ptr, Acc) ->
    aks(T, N, Ptr + 1, Acc ++ [H]).

%% C[n, x] = (-1)^(n + x)A[n, x]
coefficients([], _, _, Acc) ->
    Acc;
coefficients([H|T], N, Ptr, Acc) when (N + Ptr) rem 2 =/= 0 ->
    coefficients(T, N, Ptr + 1, Acc ++ [-1 * H]);
coefficients([H|T], N, Ptr, Acc) ->
    coefficients(T, N, Ptr + 1, Acc ++ [H]).

%% Iterate over pascal's triangle.
iterate(0, Acc) ->
    Acc;
iterate(N, Acc) ->
    iterate(N - 1, pascal(Acc, [])).

pascal([1], Acc) ->
    [1] ++ Acc ++ [1];
pascal([H|T], Acc) ->
    pascal(T, Acc ++ [H + hd(T)]).