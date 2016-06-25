(*
##
## ATS-extsolve-smt2:
## Outputing ATS-constraints
## in the format of smt-lib2
##
*)

(* ****** ****** *)

(*
//
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start time: June, 2016
//
** Author: William Blair
** Authoremail: wdblairATgmailDOTcom
** Start time: Some time in 2015
//
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

staload "./patsolve_smt2_commarg.sats"
staload "./patsolve_smt2_solving.sats"

(* ****** ****** *)

implement
fprint_commarg(out, ca) = (
//
case+ ca of
//
| CAhelp(str) =>
    fprint! (out, "CAhelp(", str, ")")
//
| CAgitem(str) =>
    fprint! (out, "CAgitem(", str, ")")
//
| CAinput(str) =>
    fprint! (out, "CAinput(", str, ")")
//
| CAoutput(knd, str) =>
    fprint! (out, "CAoutput(", knd, ", ", str, ")")
//
(*
| CAscript(str) => fprint! (out, "CAscript(", str, ")")
| CAsolver(str) => fprint! (out, "CAsolver(", str, ")")
*)
//
| CAargend((*void*)) => fprint! (out, "CAargend(", ")")
//
) (* end of [fprint_commarg] *)

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
patsolve_smt2_cmdline
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
| "-o" => let
    val ca =
      CAoutput(0, arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
| "--output" => let
    val ca =
      CAoutput(0, arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
| "--output-w" => let
    val ca =
      CAoutput(1, arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
| "--output-a" => let
    val ca =
      CAoutput(2, arg)
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
val args = aux(argc, argv, 0, nil_vt)
//
in
//
list_vt_reverse(list_vt_cons(CAargend(), args))
//
end // end of [patsolve_smt2_cmdline]

(* ****** ****** *)
//
extern fun patsolve_smt2_help(): void
//
extern fun patsolve_smt2_input(): void
extern fun patsolve_smt2_output(knd: int): void
//
extern fun patsolve_smt2_gitem(string): void
//
extern fun patsolve_smt2_input_arg(string): void
extern fun patsolve_smt2_output_arg(string): void
//
extern fun patsolve_smt2_argend((*void*)): void
//
extern fun patsolve_smt2_commarglst_finalize(): void
//
(* ****** ****** *)

typedef
state_struct =
@{
//
  nerr= int
//
, input= int
//
, ninput= int
//
, inpfil_ref= FILEref
//
, output= int
//
, fopen_out= int
, outfil_ref= FILEref
, outfil_mod= file_mode
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
val () = the_state.ninput := 0
//
val () = the_state.inpfil_ref := stdin_ref
//
val () = the_state.output := 0
//
val () = the_state.fopen_out := 0
val () = the_state.outfil_ref := stdout_ref
val () = the_state.outfil_mod := file_mode_w
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
(*
val () =
fprintln!
(
  stdout_ref
, "patsolve_smt2_commarglst: process_arg: x = ", x
) (* end of [val] *)
*)
//
in
//
case+ x of
//
| CAhelp _ => patsolve_smt2_help()
//
| CAinput _ => patsolve_smt2_input()
//
| CAoutput
    (knd, _) => patsolve_smt2_output(knd)
  // CAoutput
//
| CAgitem(str) => patsolve_smt2_gitem(str)
//
| CAargend((*void*)) => patsolve_smt2_argend()
//
(*
| CAscript(str) => fprint! (out, "CAscript(", str, ")")
*)
//
end // end of [process_arg]

(* ****** ****** *)

implement
patsolve_smt2_commarglst
  (xs) = let
(*
val () = println! ("patsolve_smt2_commarglst")
*)
in
//
case+ xs of
| ~list_vt_cons
    (x, xs) => let
    val () = process_arg(x)
  in
    patsolve_smt2_commarglst (xs)
  end // end of [list_vt_cons]
//
| ~list_vt_nil
    ((*void*)) => patsolve_smt2_commarglst_finalize ()
  // end of [list_vt_nil]
//
end // end of [patsolve_smt2_commarglst]

(* ****** ****** *)

implement
patsolve_smt2_help() =
{
//
val () =
println!
  ("patsolve_smt2_help: ...")
//
} (* end of [patsolve_smt2_help] *)

(* ****** ****** *)

implement
patsolve_smt2_input() =
{
//
(*
val () =
println!
  ("patsolve_smt2_input: ...")
*)
//
val () = !the_state.input := 1
//
} (* end of [patsolve_smt2_input] *)

(* ****** ****** *)

implement
patsolve_smt2_output
  (knd) =
{
//
(*
val () =
println!
  ("patsolve_smt2_output: ...")
*)
//
val () = !the_state.output := 1
val () =
(
  ifcase
    | knd = 1 => !the_state.outfil_mod := file_mode_w
    | knd = 2 => !the_state.outfil_mod := file_mode_a
    | _(* else *) => ()
) : void // end of [val]
//
} (* end of [patsolve_smt2_output] *)

(* ****** ****** *)

implement
patsolve_smt2_gitem(arg) = let
//
(*
val () =
println!
  ("patsolve_smt2_gitem: arg = ", arg)
*)
//
macdef input() = (!the_state.input > 0)
macdef output() = (!the_state.output > 0)
//
in
//
case+ 0 of
| _ when input() =>
  {
    val () = patsolve_smt2_input_arg(arg)
    val () = !the_state.ninput := !the_state.ninput+1
  } (* input() *)
| _ when output() =>
  {
    val () = patsolve_smt2_output_arg(arg)
  } (* input() *)
| _ (*unrecognized*) => ()
//
end (* end of [patsolve_smt2_gitem] *)

(* ****** ****** *)

implement
patsolve_smt2_input_arg
  (path) = let
//
val
opt =
fileref_open_opt(path, file_mode_r)
//
in
//
case+ opt of
| ~Some_vt(filr) =>
  {
//
    val c3t0 =
      parse_fileref_constraints(filr)
    // end of [val]
    val ((*void*)) = fileref_close(filr)
//
(*
    val () =
    fprint! (
      stdout_ref
    , "patsolve_smt2_input_arg: c3t0 =\n"
    ) (* end of [fprint] *)
    val () =
      fpprint_c3nstr(stdout_ref, c3t0)
    // end of [val]
    val () = fprint_newline (stdout_ref)
*)
//
    val out = !the_state.outfil_ref
    val ((*void*)) = c3nstr_smt2_solve(out, c3t0)
//
  } (* end of [Some_vt] *)
//
| ~None_vt((*void*)) =>
  {
//
(*
    val () = !the_state.inpfil_ref := stdin_ref
*)
//
    val () =
    prerrln!
      ("The file [", path, "] cannot be opened for read!")
    // end of [val]
//
  } (* end of [None_vt] *)
//
end // end of [patsolve_smt2_input_arg]

(* ****** ****** *)

implement
patsolve_smt2_output_arg
  (path) = let
//
val n1 = !the_state.fopen_out
val f1 = !the_state.outfil_ref
val () = if n1 > 0 then fileref_close(f1)
//
val fm = !the_state.outfil_mod
val opt = fileref_open_opt(path, fm)
//
in
//
case+ opt of
| ~Some_vt(filr) =>
  {
//
    val () = !the_state.fopen_out := 1
    val () = !the_state.outfil_ref := filr
//
  } (* end of [Some_vt] *)
//
| ~None_vt((*void*)) =>
  {
//
    val () = !the_state.fopen_out := 0
    val () = !the_state.outfil_ref := stderr_ref
//
    val () =
    prerrln!
      ("The file [", path, "] cannot be opened for write!")
    // end of [val]
//
  } (* end of [None_vt] *)
//
end // end of [patsolve_smt2_output_arg]

(* ****** ****** *)

implement
patsolve_smt2_argend
  ((*void*)) = let
//
macdef test() =
  (!the_state.input > 0 && !the_state.ninput = 0)
//
in
//
case+ 0 of
| _ when test() =>
  {
//
    val inp = stdin_ref
    val out = !the_state.outfil_ref
    val c3t0 = parse_fileref_constraints(inp)
    val ((*void*)) = c3nstr_smt2_solve(out, c3t0)
//
  } (* end of [test] *)
| _ (*rest*) => ((*ignored*))
//
end (* end of [patsolve_smt2_argend] *)

(* ****** ****** *)

implement
patsolve_smt2_commarglst_finalize
  ((*void*)) =
{
//
  val n1 = !the_state.fopen_out
  val f1 = !the_state.outfil_ref
  val () = if n1 > 0 then fileref_close(f1)
//
} (* end of [patsolve_smt2_commarglst_finalize] *)

(* ****** ****** *)

(* end of [patsolve_smt2_commarg.dats] *)
