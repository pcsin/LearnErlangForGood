-module(geometry).
-export([what_is/1, test/0]).

test() ->
    square = what_is({ shape, 10, 10}),
    rectangle = what_is({ shape, 45, 89 }),
    done.

what_is({ shape, S, S }) ->
    square;
what_is({ shape, W, H }) ->
    rectangle.