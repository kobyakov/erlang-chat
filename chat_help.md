### How to build

    erl
    c(message_store).
    c(message_router).
    c(mucc).
    c(web_server).
    c(chat_client).

### How to start

    message_router:start_link().
    mucc:start_link().
    web_server:start_link(9999).

### And work

_In Erlang_

    chat_client:register_nickname("john").
    chat_client:send_message("wayne","hello").

_In another console_

    curl -i localhost:9999/register?nick=wayne
    curl -i localhost:9999/poll?nick=wayne
    curl -i "localhost:9999/send?nick=wayne&to=john&msg=hello"
