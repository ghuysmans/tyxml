
(* Elements and attributes are technically utf8, but ascii is enough for now.

   see <http://www.w3.org/TR/html51/syntax.html#syntax>
*)

(* In the ocaml parser:
   let identchar = ['A'-'Z' 'a'-'z' '_' '\'' '0'-'9']
*)
let is_identchar = function
  | 'A'..'Z'
  | 'a'..'z'
  | '_'
  | '\''
  | '0'..'9' -> true
  | _ -> false

let to_ocaml_bytes s =
  let f c = if is_identchar c then c else '_' in
  Bytes.init (String.length s) (fun i -> f s.[i])

let to_ocaml s =
  Bytes.to_string (to_ocaml_bytes s)

let ident s =
  let s = to_ocaml_bytes s in
  let s = Bytes.mapi (fun i c ->
    if i = 0 then Char.lowercase c else c)
    s in
  Bytes.to_string s

let attrib s =
  "a_" ^  to_ocaml s

let polyvar s =
  let s = to_ocaml_bytes s in
  let s = Bytes.mapi (fun i c ->
    if i = 0 then Char.uppercase c else c)
    s in
  "`" ^ Bytes.to_string s
