exception Input_is_too_large
exception Ocsigen_Bad_Request
exception Ocsigen_Request_too_long
val id : 'a -> 'a
val comp : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b
val list_remove_first_if_any : 'a -> 'a list -> 'a list
val list_remove_first_if_any_q : 'a -> 'a list -> 'a list
val list_remove_first : 'a -> 'a list -> 'a list
val list_remove_first_q : 'a -> 'a list -> 'a list
val list_remove_all : 'a -> 'a list -> 'a list
val list_remove_all_q : 'a -> 'a list -> 'a list
val list_remove_all_assoc : 'a -> ('a * 'b) list -> ('a * 'b) list
val list_remove_all_assoc_q : 'a -> ('a * 'b) list -> ('a * 'b) list
val list_last : 'a list -> 'a
val list_assoc_remove : 'a -> ('a * 'b) list -> 'b * ('a * 'b) list
val list_is_prefix : 'a list -> 'a list -> bool
val remove_dotdot : string list -> string list
val remove_slash_at_beginning : string list -> string list
val recursively_remove_slash_at_beginning : string list -> string list
val remove_slash_at_end : string list -> string list
val remove_internal_slash : string list -> string list
val add_end_slash_if_missing : string list -> string list
val change_empty_list : string list -> string list
val remove_end_slash : string -> string
val string_of_url_path : string list -> string
val string_first_diff : string -> string -> int -> int -> int
val add_to_string : string -> string -> string -> string
val concat_strings : string -> string -> string -> string
val basic_sep : char -> string -> string * string
val remove_spaces : string -> int -> int -> string
val sep : char -> string -> string * string
val split : ?multisep:bool -> char -> string -> string list
val string_of_exn : exn -> string
val fst3 : 'a * 'b * 'c -> 'a
val snd3 : 'a * 'b * 'c -> 'b
val thd3 : 'a * 'b * 'c -> 'c

type ('a, 'b) leftright = Left of 'a | Right of 'b

val get_inet_addr : string -> Unix.inet_addr Lwt.t
(** returns the first inet address for one host *)

(** IP address parsing *)
type ip_address =
  | IPv4 of int32
  | IPv6 of int64 * int64
exception Invalid_ip_address of string
val parse_ip : string -> ip_address * (ip_address option)
val match_ip : ip_address * (ip_address option) -> ip_address -> bool

module StringSet : Set.S with type elt = string