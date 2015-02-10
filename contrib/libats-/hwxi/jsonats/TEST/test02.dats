(*
** A simple implementation
** of tokenization based on jsonats
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

%{^
#define \
atstyarr_field_undef(fname) fname[]
%} // end of [%{]

(* ****** ****** *)
//
staload "{$LIBATSHWXI}/cstream/SATS/cstream.sats"
staload "{$LIBATSHWXI}/cstream/SATS/cstream_tokener.sats"
//
staload _ = "libats/DATS/stringbuf.dats"
staload _ = "{$LIBATSHWXI}/cstream/DATS/cstream.dats"
staload _ = "{$LIBATSHWXI}/cstream/DATS/cstream_tokener.dats"
//
(* ****** ****** *)

staload "./../SATS/jsonats.sats"
staload "./../DATS/jsonats.dats"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val inp = stdin_ref
//
val jsvs =
  jsonats_parsexnlst_fileref (inp)
//
val () = print! ("jsvs = ")
local
implement
fprint_val<jsonval>
  (out, x) = fprint_jsonval (out, x)
in (*in-of-local*)
val () = fprint_list_sep (stdout_ref, jsvs, "\n")
end // end of [local]
val () = fprint_newline (stdout_ref)
//
val ((*void*)) = fileref_close (inp)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test02.dats] *)
