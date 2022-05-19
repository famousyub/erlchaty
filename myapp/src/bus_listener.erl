-module(bus_listener).
-behaviour(ebus_handler).

%%Api
-export([handle_msg/2]).


handle_msg({_channel,{Sender,Type,Msg}},User)->
    if 
        Sender =:= User -> ok ;
        true -> User ! {Type,Msg}
    end.