-module (recieve_message).
-compile(export_all).

dolphin1() ->
    receive
        do_a_flip ->
            io:format("How about no?~n");
        fish ->
            io:format("So long and thanks for all the fish!~n");
        _ ->
            io:format("Heh, we're smarter than you humans.~n")
    end.

factorial (0) ->
    1;
factorial (N) ->
    N * factorial (N - 1).

factorial () ->
    receive
        N -> io: format ("~p~n", [factorial(N)])
    end.

