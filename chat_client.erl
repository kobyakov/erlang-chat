-module(chat_client).

-compile(export_all).

register_nickname(Nickname) ->
	Pid = spawn(chat_client, handle_messages, [Nickname]),
	message_router:register_nick(Nickname, Pid).

unregister_nickname(Nickname) ->
	message_router:unregister_nick(Nickname).

send_message(Adressee, MessageBody) ->
	message_router:send_chat_message(Adressee, MessageBody).

handle_messages(Nickname) ->
	receive
		{printmsg, MessageBody} -> 
			io:format("~p received ~p~n", [Nickname, MessageBody]),
			handle_messages(Nickname);
		stop ->
			ok
	end.

print_message(Who, MessageBody) ->
	io:format("~p received  ~p~n", [Who, MessageBody]).

start_router() ->
	message_router_new:start_link().