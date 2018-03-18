-module(excercises).
-compile(export_all).

my_tuple_to_list(Tup) ->
    my_tuple_to_list(Tup, size(Tup), 1).

my_tuple_to_list(_, 0, _) ->
    [];
my_tuple_to_list(Tup, S, I) ->
    [element(I, Tup) | my_tuple_to_list(Tup, S - 1, I + 1)].

my_list_to_tuple(L) ->
    my_list_to_tuple(L, [{}]).

%%my_list_to_tuple([1,2,3,4,4,8,8]). -> [{1,1}, {2,1}, {3,1}, {4, 2}, {8, 2}]
my_list_to_tuple([], Acc) ->
    Acc;
my_list_to_tuple([H|T], [{H, Count} | S]) ->
    my_list_to_tuple(T, [{ H, Count + 1} | S]);
my_list_to_tuple([H|T], Acc) ->
    my_list_to_tuple(T, [{H, 1} | Acc]).


my_seq(N) ->
    my_seq(N, 0).

my_seq(0, _) ->
    [];
my_seq(N, S) ->
    [ S | my_seq(N - 1, S + 1)].

my_list_reverse([]) ->
    [];
my_list_reverse([H|T]) ->
    my_list_reverse(T) ++ [H].

my_split_list(L) ->
    case length(L) rem 2 of
        0 -> MIdx = length(L) div 2;
        1 -> MIdx = length(L) div 2 + 1
    end,
    Left = my_split_list(L, 1, 1, MIdx),
    Right = my_split_list(L, 1, MIdx + 1, length(L)),
{Left, Right}.

my_split_list([], _, _, _) ->
    [];
my_split_list(_, _, S, E) when S > E ->
    [];
my_split_list([H|_], E, _, E) ->
    [H];
my_split_list([H|T], Ptr, S, E) ->
    case Ptr >= S of
        true -> [ H | my_split_list(T, Ptr + 1, S, E)];
        false -> my_split_list(T, Ptr + 1, S, E)
    end.


my_reverse_nlog([]) ->
    [];
my_reverse_nlog(L) when length(L) =:= 1 ->
    L;
my_reverse_nlog(L) ->
    {SplitL, SplitR} = my_split_list(L),
    Left = my_reverse_nlog(SplitL),
    Right = my_reverse_nlog(SplitR),
    Right ++ Left.