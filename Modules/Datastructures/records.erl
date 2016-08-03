-module (records).
-compile (export_all).
-record (user, {name, id, age, type}).

get_user(Name, Id, Age, Type) ->
    #user {
            name = Name,
            id = Id,
            age = Age,
            type = Type
    }.

%% usage of functions in funtion heads
is_allowed (#user{type=admin}) ->
    "User is allowed";
is_allowed (#user{}) ->
    "User is not allowed".

is_allowed2 (U = #user{}) when U#user.age > 18 ->
    U#user.name ++ "Is allowed";
is_allowed2 (U = #user{}) ->
    U#user.name ++ "Is not allowed".