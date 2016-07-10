-module (useless).
-export ([add/2, print/1]).

add(X, Y) ->
    X + Y.

print (Text) ->
    io: format(Text).