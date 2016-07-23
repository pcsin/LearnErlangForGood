-module (tree).
-compile ([export_all, {no_auto_import, [empty/0, insert/3, look_up/2]}]).

empty () ->
    {node, 'nil'}.

insert (Key, Value, {node, 'nil'}) ->
    {Key, Value, empty(), empty()};
insert (Key, Value, {RKey, RValue, LTree, RTree}) when Key < RKey ->
    {RKey, RValue, insert (Key, Value, LTree), RTree};
insert (Key, Value, {RKey, RValue, LTree, RTree}) when Key > RKey ->
    {RKey, RValue, LTree, insert (Key, Value, RTree)};
insert (Key, Value, {_, _, LTree, RTree}) ->
    {Key, Value, LTree, RTree}.

look_up (_, {node, 'nil'}) ->
    undefined;
look_up (Key, {RKey, _, LTree, _}) when Key < RKey ->
    look_up (Key, LTree);
look_up (Key, {RKey, _, _, RTree}) when Key > RKey ->
    look_up (Key, RTree);
look_up (_, {_, RValue, _, _}) ->
    {ok, RValue}.
