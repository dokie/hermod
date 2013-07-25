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
		    {"/locations", location_handler, []}
	     ]}
    ]),
    {ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
	    {env, [{dispatch, Dispatch}]}
    ]),
    hermod_sup:start_link().

stop(_State) ->
    ok.
