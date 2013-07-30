-module(hermod_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
	     {'_', [
	        {"/", cowboy_static, [
                     {directory, {priv_dir, hermod, []}},
                     {file, "home.json"},
                     {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
                 ]},
            {"/rel/[...]", cowboy_static, [
                     {directory, {priv_dir, hermod, [<<"rel">>]}},
                     {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
                  ]},
            {"/param/[...]", cowboy_static, [
                     {directory, {priv_dir, hermod, [<<"param">>]}},
                     {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
                  ]},
            {"/licenses", licenses_handler, []}
	     ]}
    ]),
    {ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
	    {env, [{dispatch, Dispatch}]}
    ]),
    hermod_sup:start_link().

stop(_State) ->
    ok.
