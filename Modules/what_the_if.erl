-module(what_the_if).
-compile(export_all).

if_elseif_else() ->
    if 1 =:= 3 -> works;
       1 =:= 1 andalso 1 =:= 2 -> works;
       true -> default
    end.

if_else_function (N) -> 
    if N rem 2 =:= 0 ->
        even;
        true -> odd % else in other languages
    end.

%% using if guards
get_animal_sound (Animal) ->
    Sound = if Animal == cat -> "meow";
               Animal == dog -> "bow";
               Animal == snake -> "hiss";
               true -> "unknown"
            end,
    {Animal, Sound}. 

%% get animal sound using pattern match
get_animal_sound_pattern_match (cat) ->
    "meow";
get_animal_sound_pattern_match (dog) ->
    "bow";
get_animal_sound_pattern_match (snake) ->
    "hiss";
get_animal_sound_pattern_match (_) ->
    "unknown".

%% In case...of

%% This routing can also be implemented using function clauses.
beach (Temperature) ->
    case Temperature of 
        {celcius, N} when N > 20, N < 35 -> favourable;
        {kelvin, N} when N > 290, N < 398 -> favourable;
        _ -> unfavourable
    end.
