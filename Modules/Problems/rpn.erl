-module (rpn).
-compile (export_all).

read(N) ->
    case string:to_float (N) of
         {error, no_float} -> list_to_integer (N);
         {F, _} -> F    
    end.
%% example usage rpn: fold (string: tokens ("5 5 +"), fun rpn: accumulate/2, []).
fold ([], _F, Start) ->
    Start;
fold ([H|T], F, Start) ->
    fold (T, F, F(H, Start)).

accumulate ("+", [V1, V2 | S]) -> [V1 + V2 | S];
accumulate ("-", [V1, V2 | S]) -> [V2 - V1 | S];
accumulate ("/", [V1, V2 | S]) -> [V2 / V1 | S];
accumulate ("*", [V1, V2 | S]) -> [V1 * V2 | S];
accumulate (Val, Stack) ->
   try read (Val) of
       N -> [N | Stack]
   catch 
       error: _Exception -> {badinput, "Illegal RPN notation."}
   end.