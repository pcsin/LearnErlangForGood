-module (useless).
-export ([add/2, print/1, greet/2]).
-author ("Piyush Singhal").

add(X, Y) ->
    X + Y.

print (Text) ->
    io: format(Text).

%% Example of function clauses and pattern matching within function
%% instead of first binding both(gener, and name) and then making a decision within
%% function body, here based on the patter the appropriate function is called.
%% Function clauses are separated by ; and togther they form function declaration.
greet (male, Name) ->
    io: format ("Hello Mr. ~s!~n", [Name]);
greet (female, Name) ->
    io: format ("Hello Mrs/Ms. ~s!~n", [Name]);
greet (_, Name) -> 
    io: format ("Hello ~s!~n", [Name]).