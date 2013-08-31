-module(db).
-export([new/0, destroy/1, write/3, delete/2, read/2, match/2]).

new() -> [].

destroy(_) -> ok.

write(Key, Element, Db) -> add_to_db({Key, Element}, Db, []).

delete(Key, Db) -> remove_from_db(Key, Db, []).

read(Key, Db) -> get_value_from_db(Key, Db).

match(Element, Db) -> get_key_from_db(Element, Db, []).


add_to_db(Entry, [], New_db)  -> [Entry | New_db];
add_to_db(Entry, [Old_head | Old_tail], New_db) -> add_to_db(Entry, Old_tail, [Old_head | New_db]).

remove_from_db(_, [], New_db) -> New_db;
remove_from_db(Key, [{Key, _} | Old_tail], New_db) -> remove_from_db(Key, Old_tail, New_db);
remove_from_db(Key, [Old_head | Old_tail], New_db) -> remove_from_db(Key, Old_tail, [Old_head | New_db]).

get_value_from_db(_, []) -> {error, instance};
get_value_from_db(Key, [{Key, Element} | _]) -> {ok, Element};
get_value_from_db(Key, [_ | Tail]) -> get_value_from_db(Key, Tail).

get_key_from_db(_, [], Keys) -> Keys;
get_key_from_db(Element, [{Key, Element} | Tail], Keys) -> get_key_from_db(Element, Tail, [Key | Keys]);
get_key_from_db(Element, [_ | Tail], Keys) -> get_key_from_db(Element, Tail, Keys).
