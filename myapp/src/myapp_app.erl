%%%-------------------------------------------------------------------
%% @doc myapp public API
%% @end
%%%-------------------------------------------------------------------

-module(myapp_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->


    ok = application:ensure_all_started(ebus),


    Dispatch = cowboy_router:compile(
                 [{'_', [
                         {"/", cowboy_static, {priv_file, chatbus, "index.html"}},
                         {"/ws", ws_handler, []},
                         {"/[...]", cowboy_static, {priv_dir, chatbus, "./"}}]}]),
    {ok, _} = cowboy:start_http(http, 100, [{port, 9090}], [{env, [{dispatch, Dispatch}]}]),



    % Server_name = "hello ",
    % App = myapp,
    % {ok, _} = application:ensure_all_started(myapp_sup),
    % Options = #{
    %     port => 8088,
    %     apps=>[App]},
    %%https://github.com/beamX/chatBus/tree/feat-chatbus-client/apps/chat_client/polymer
    % myapp_sup:start(Server_name,Options).

    

    myapp_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
