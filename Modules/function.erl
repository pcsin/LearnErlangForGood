-module (function).
-compile (export_all).

%% function to return the head of a list.
head ([H|_]) ->
    H.

%% funtion to test if two values passed are same or not. (uses function clauses).
same (X, X) ->
    true;
same (_, _) ->
    false.

%% usage of guards
right_age (X) when X >= 18 andalso X < 100 -> % this will match the pattern iff the guard succeeds
    true;
right_age (_) ->
    false.