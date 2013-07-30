%%%-------------------------------------------------------------------
%%% @author mike <mike@mint15-mike>
%%% @copyright (C) 2013, mike
%%% @doc
%%%
%%% @end
%%% Created : 25 Jul 2013 by mike <mike@mint15-mike>
%%%-------------------------------------------------------------------
-module(licenses_handler).

%% API
-export([init/3]).
-export([rest_init/2]).
-export([content_types_provided/2]).

-export([as_json/2]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------
init(_Transport, _Req, _Table) ->
    {upgrade, protocol, cowboy_rest}.

rest_init(Req, Table) ->
    {ok, Req, Table}.

content_types_provided(Req, State) ->
    {[
      {{<<"application">>, <<"json">>, []}, as_json}
      ], Req, State}.

as_json(Req, State) ->
    Body = <<"{\"id\": 1234}">>,
    {Body, Req, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
