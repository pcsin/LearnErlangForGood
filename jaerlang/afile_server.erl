-module(afile_server).
-export([start/1, my_file_server/1]).

start(Dir) ->
    spawn(afile_server, my_file_server, [Dir]).

my_file_server(Dir) ->
    receive
        { Client, list_dir } ->
            Client ! { self(), file: list_dir(Dir) };
        { Client, { get_file, FileName } } ->
            FullName = filename: join(Dir, FileName),
            Client ! { self(), file: read_file(FullName)}
    end,
    my_file_server(Dir).