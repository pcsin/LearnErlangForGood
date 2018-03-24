-module(abc).
-compile(export_all).

blocks() ->
    [
        { "B", "O" },
        { "X", "K" },
        { "D", "Q" },
        { "C", "P" },
        { "N", "A" },
        { "G", "T" },
        { "R", "E" },
        { "T", "G" },
        { "Q", "D" },
        { "F", "S" },
        { "J", "W" },
        { "H", "U" },
        { "V", "I" },
        { "A", "N" },
        { "O", "B" },
        { "E", "R" },
        { "F", "S" },
        { "L", "Y" },
        { "P", "C" },
        { "Z", "M" }
    ].

can_make_word(L) ->
    can_make_word(L, blocks()).

can_make_word([], _) ->
    true;
can_make_word([H|T], Blocks) ->
    case take_block(H, Blocks) of 
        { true, RemBlocks } -> can_make_word(T, RemBlocks);
        { false, _ } -> false
    end.

take_block(A, Blocks) ->
    take_block(A, Blocks, [], false).

take_block(_, [], Acc, Taken) ->
    { Taken, Acc };
take_block(A, [{X, Y} | T], Acc, true) ->
    take_block(A, T, Acc ++ [{X, Y}], true);
take_block(A, [{[A], _} | T], Acc, false) ->
    take_block(A, T, Acc, true);
take_block(A, [{ _, [A]} | T], Acc, false) ->
    take_block(A, T, Acc, true);
take_block(A, [{X, Y} | T], Acc, false) ->
    take_block(A, T, Acc ++ [{X, Y}], false).


