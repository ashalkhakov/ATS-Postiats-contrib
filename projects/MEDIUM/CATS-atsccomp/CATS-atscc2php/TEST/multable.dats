(* ****** ****** *)
//
// HX-2014-09:
// A running example
// from ATS2 to PHP
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2PHP}/staloadall.hats"
//
(* ****** ****** *)
//
staload _ =
"{$LIBATSCC2PHP}/DATS/basics.dats"
//
(* ****** ****** *)
//
extern
fun multable (): void = "mac#multable"
//
(* ****** ****** *)

implement
multable () = let
//
val N = 10
//
fun
loop1 (i: int): void =
(
if i < N then
(
  echo ("<tr>\n"); loop2 (i, 1);
  echo ("\n</tr>\n"); loop1 (i+1)
) else ((*void*))
) (* end of [loop1] *)
//
and
loop2
(
  i: int, j: int
) : void =
(
if j < N then
(
  ( if j > i
    then echo ("<td width=5% align=center></td>")
    else echo ("<td width=5% align=center>", i * j, "</td>")
  ) ; loop2 (i, j+1)
) else ((*void*))
) (* end of [loop2] *)
//
in
  loop1 (1)
end // end of [mutable]

(* ****** ****** *)

extern
fun
multable_test
(
// argumentless
) : void = "mac#multable_test"
implement
multable_test () = multable ()

(* ****** ****** *)

(* end of [multable.dats] *)
