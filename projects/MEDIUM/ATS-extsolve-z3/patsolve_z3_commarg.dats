(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
STDIO = "libc/SATS/stdio.sats"
//
(* ****** ****** *)
//
#define
PATSOLVE_targetloc "./.ATS-extsolve"
//
staload "{$PATSOLVE}/patsolve_cnstrnt.sats"
staload "{$PATSOLVE}/patsolve_parsing.sats"
//
(* ****** ****** *)

staload "./patsolve_z3_commarg.sats"
staload "./patsolve_z3_solving.sats"

(* ****** ****** *)

implement
fprint_commarg
  (out, ca) =
(
case+ ca of
| CAhelp(str) => fprint! (out, "CAhelp(", str, ")")
| CAgitem(str) => fprint! (out, "CAgitem(", str, ")")
| CAinput(str) => fprint! (out, "CAinput(", str, ")")
| CAoutput(str) => fprint! (out, "CAoutput(", str, ")")
| CAscript(str) => fprint! (out, "CAscript(", str, ")")
)

(* ****** ****** *)

fun{
} argv_getopt_at
  {n:int}{i:nat}
(
  n: int n, argv: !argv(n), i: int i
) : stropt =
(
//
if i < n
  then stropt_some (argv[i]) else stropt_none ()
// end of [if]
//
) (* end of [argv_getopt_at] *)

(* ****** ****** *)

implement
patsolve_z3_cmdline
  (argc, argv) = let
//
vtypedef
res_vt = commarglst_vt
//
fun
aux
{n:int}
{i:nat | i <= n}
(
  argc: int n
, argv: !argv(n)
, i: int i, res0: res_vt
) : res_vt = let
in
//
if
i < argc
then let
//
val arg = argv[i]
//
in
//
case+ arg of
//
| "-h" => let
    val ca =
      CAhelp(arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
| "--help" => let
    val ca =
      CAhelp(arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
//
| "-i" => let
    val ca =
      CAinput(arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
| "--input" => let
    val ca =
      CAinput(arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
//
| _ (*rest*) => let
    val res0 =
      cons_vt(CAgitem(arg), res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of [...]
//
end // end of [then]
else res0 // end of [else]
//
end // end of [aux]
//
in
//
list_vt_reverse
  (aux(argc, argv, 0, nil_vt(*void*)))
//
end // end of [patsolve_z3_cmdline]

(* ****** ****** *)
//
extern fun patsolve_z3_help(): void
extern fun patsolve_z3_input(): void
extern fun patsolve_z3_gitem(string): void
extern fun patsolve_z3_input_arg(string): void
//
extern fun patsolve_z3_commarglst_finalize(): void
//
(* ****** ****** *)

typedef
state_struct =
@{
//
  nerr= int
, input= int
, fopen_inp= int
, inpfil_ref= FILEref
//
} (* end of [state_struct] *)

(* ****** ****** *)

local
//
var
the_state: state_struct?
//
val () = the_state.nerr := 0
//
val () = the_state.input := 0
//
val () = the_state.fopen_inp := 0
val () = the_state.inpfil_ref := stdin_ref
//
in (* in-of-local *)
//
val
the_state
  : ref(state_struct) =
  ref_make_viewptr(view@the_state | addr@the_state)
//
end // end of [local]

(* ****** ****** *)

fun
process_arg
  (x: commarg): void = let
//
val () =
fprintln!
  (stdout_ref, "patsolve_z3_commarglst: process_arg: x = ", x)
// end of [val]
//
in
//
case+ x of
//
| CAhelp _ => patsolve_z3_help ()
//
| CAinput _ => patsolve_z3_input ()
//
| CAgitem(str) => patsolve_z3_gitem(str)
//
(*
| CAoutput(str) => fprint! (out, "CAoutput(", str, ")")
| CAscript(str) => fprint! (out, "CAscript(", str, ")")
*)
| _ (*rest-of-CA*) => ()
//
end // end of [process_arg]

(* ****** ****** *)

implement
patsolve_z3_commarglst
  (xs) = let
(*
val () = println! ("patsolve_z3_commarglst")
*)
in
//
case+ xs of
| ~list_vt_cons
    (x, xs) => let
    val () = process_arg(x)
  in
    patsolve_z3_commarglst (xs)
  end // end of [list_vt_cons]
//
| ~list_vt_nil
    ((*void*)) => patsolve_z3_commarglst_finalize ()
  // end of [list_vt_nil]
//
end // end of [patsolve_z3_commarglst]

(* ****** ****** *)

implement
patsolve_z3_help() =
{
//
val () =
prerrln!
  ("patsolve_z3_help: ...")
//
} (* end of [patsolve_z3_help] *)

(* ****** ****** *)

implement
patsolve_z3_input() =
{
//
val () =
prerrln!
  ("patsolve_z3_input: ...")
//
val () = !the_state.input := 1
//
} (* end of [patsolve_z3_input] *)

(* ****** ****** *)

implement
patsolve_z3_gitem(arg) = let
//
val () =
prerrln!
  ("patsolve_z3_gitem: arg = ", arg)
//
macdef input() = (!the_state.input > 0)
//
in
//
case+ 0 of
| _ when
    input() =>
  (
    patsolve_z3_input_arg(arg)
  )
| _ (*unrecognized*) => ()
//
end (* end of [patsolve_z3_gitem] *)

(* ****** ****** *)

implement
patsolve_z3_input_arg
  (path) = let
//
val opt =
fileref_open_opt(path, file_mode_r)
//
in
//
case+ opt of
| ~Some_vt(filr) =>
  {
//
    val n0 = !the_state.fopen_inp
    val () = !the_state.fopen_inp := 1
//
    val f0 = !the_state.inpfil_ref
    val () = if n0 > 0 then fileref_close(f0)
    val () = !the_state.inpfil_ref := filr
//
    val c3t0 = parse_fileref_constraints(filr)
//
(*
    val () =
    fprint! (
      stdout_ref
    , "patsolve_z3_input_arg: c3t0 =\n"
    ) (* end of [fprint] *)
    val () = fpprint_c3nstr(stdout_ref, c3t0)
    val () = fprint_newline (stdout_ref)
*)
//
    val () = c3nstr_z3_solve (c3t0)
//
  } (* end of [Some_vt] *)
//
| ~None_vt((*void*)) =>
  {
//
    val n0 = !the_state.fopen_inp
    val () = !the_state.fopen_inp := 0
//
    val f0 = !the_state.inpfil_ref
    val () = if n0 > 0 then fileref_close(f0)
    val () = !the_state.inpfil_ref := stdin_ref
//
    val () =
    prerrln!
      ("The file [", path, "] cannot be opened for read!")
    // end of [val]
//
  } (* end of [None_vt] *)
//
end // end of [patsolve_z3_input_arg]

(* ****** ****** *)

implement
patsolve_z3_commarglst_finalize
  ((*void*)) =
{
  val n0 = !the_state.fopen_inp
  val f0 = !the_state.inpfil_ref
  val () = if n0 > 0 then fileref_close(f0)
} (* end of [patsolve_z3_commarglst_finalize] *)

(* ****** ****** *)

(* end of [patsolve_z3_commarg.dats] *)
