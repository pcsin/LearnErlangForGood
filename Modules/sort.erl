-module (sort).
-compile ([export_all, {no_auto_import, partition/4}]).

quick_sort ([]) -> [];
quick_sort ([Pivot|Rest]) ->
    {Smaller, Larger} = partition (Pivot, Rest, [], []),
    quick_sort (Smaller) ++ [Pivot] ++ quick_sort (Larger).

partition (_, [], Smaller, Larger) ->
    {Smaller, Larger};

partition (Pivot, [H|T], Smaller, Larger) ->
    if Pivot =< H -> partition (Pivot, T, Smaller, [H | Larger]);
       Pivot > H -> partition (Pivot, T, [H | Smaller], Larger)
    end.
        
%% quick sort with list comprehensions.
quick_sort_list_comprehension ([]) -> [];
quick_sort_list_comprehension ([Pivot|Rest]) ->
    quick_sort_list_comprehension([Smaller || Smaller <- Rest, Smaller =< Pivot])
    ++ 
    [Pivot]
    ++
    quick_sort_list_comprehension([Larger || Larger <- Rest, Larger > Pivot]).