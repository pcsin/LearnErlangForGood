-module (exceptions).
-compile (export_all).

%% if no type is specified throw is assumed. This will not catch any errors/exits
throws (F) ->
    try F() of
        _ -> ok
    catch
        Throw -> {throw, caught, Throw}
    end.

throws_with_type (F) when is_function(F, 0) ->
    try F() of
        _ -> ok
    catch 
        error: Error -> {throw, caught, Error};
        exit: Exit -> {throw, caught, Exit};
        throw: Throw -> {throw, caught, Throw}
    end.

%% catching specific throws/errors/exits
specific_try_catch (F) when is_function (F, 0) ->
    try F() of
        _ -> ok
    catch
        throw: mythrow -> {throw, caught};
        error: myerror -> {error, caught};
        exit: myexit -> {exit, caught};
        _:_ -> {throw, catch_all}
    end.

try_catch_with_after (F) when is_function(F) ->
    try F() of
        _ -> ok
    catch
        throw: mythrow -> {throw, caught}
    after
        io: format ("finally!")
    end.

%% more generalised form of try ... of 
whoa () ->
    try
        _Tuples = [{a, b}, {c, d}],
        _MyVar = 8*9,
        throw(my_error),
        return_this
    catch
        ExceptionType: Error -> {exception, ExceptionType, Error}
    end.

%% catcher example
catcher (X, Y) ->
    case catch X/Y of
         {'EXIT', {_Exception, _StackTrace}} -> _Exception ;
         N -> N
    end.

%% avoiding local returns in tree type structure using throw
has_value1 (_Val, {node, 'nil'}) ->
    false;
has_value1 (Val, {node, {_Key, Val, _Left, _Right}}) ->
    throw(true);
has_value1 (Val, {node, {_, _, Left, Right}}) ->
    has_value1 (Val, Left),
    has_value1 (Val, Right).
has_value (Val, Tree) ->
    try has_value1 (Val, Tree) of
        false -> false
    catch
        throw: true -> true
    end.
