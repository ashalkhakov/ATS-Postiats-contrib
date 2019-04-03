(*
** Parsing: ATS/JSON -> UTFPL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#define
LIBJSONC_targetloc
"\
$PATSHOME/contrib\
/atscntrb/atscntrb-hx-libjson-c"
//
(* ****** ****** *)
//
staload
"./../../SATS/utfpl.sats"
staload
"./../../SATS/PARSING/parsing.sats"
//
(* ****** ****** *)
//
staload "{$LIBJSONC}/SATS/json_ML.sats"
//
(* ****** ****** *)

implement
parse_d2sym
  (jsv0) = let
//
val-~Some_vt(jsv1) =
  jsonval_get_field (jsv0, "d2sym_sym")
//
val sym = parse_symbol (jsv1)
//
in
  d2sym_make (sym)
end // end of [parse_d2sym]

(* ****** ****** *)

(* end of [parsing_d2sym.dats] *)
