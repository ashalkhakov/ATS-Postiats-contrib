(* ****** ****** *)
//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Spring 2016
// Class Time: TR 12:30-2:00
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Hanwen Wu (hwwuATbuDOTedu)
//
(* ****** ****** *)

(*
** A worm-like game!
*)

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

#define NROW 32
(*
#define NCOL 32
*)
#define NCOL 64

(* ****** ****** *)

#define NWORM NROW

(* ****** ****** *)
//
fun succ_row(x: int): int
fun pred_row(x: int): int
//
fun succ_col(x: int): int
fun pred_col(x: int): int
//
(* ****** ****** *)

abstype worm = ptr

(* ****** ****** *)
//
datatype
wnode =
  | WN of (int(*i*), int(*j*))
//
(* ****** ****** *)
//
datatype
xnode =
  | XN0 of () | XN1 of (int(*kind*))
//
(* ****** ****** *)
//
typedef
gamebd = mtrxszref(xnode)
//
typedef
visitbd = mtrxszref(int)
//
typedef
printbd = mtrxszref(string)
//
(* ****** ****** *)
//
fun theWorm_get(): worm = "mac#"
//
fun theWorm_length(): int = "mac#"
//
fun theWorm_insert(): void = "mac#"
fun theWorm_remove(): void = "mac#"
//
(* ****** ****** *)

fun theWorm_move_up(): int = "mac#"
fun theWorm_move_down(): int = "mac#"
fun theWorm_move_left(): int = "mac#"
fun theWorm_move_right(): int = "mac#"

(* ****** ****** *)
//
fun theWorm_move_rand(): int = "mac#"
//
(* ****** ****** *)
//
fun theGamebd_get(): gamebd = "mac#"
//
fun
theWormlike_scene1((*void*)): void = "mac#"
fun
theWormlike_scene2((*void*)): void = "mac#"
//
fun
theWormlike_bonus_rand(n: int): void = "mac#"
//
(* ****** ****** *)

fun theVisitbd_get(): visitbd = "mac#"
fun theVisitbd_reset((*void*)): void = "mac#"

(* ****** ****** *)
//
fun thePrintbd_get(): printbd = "mac#"
//
fun thePrintbd_display(): void = "mac#"
//
(* ****** ****** *)
//
fun
theKeyDowns_handle
  (fwork: int -<cloref1> void): void = "mac#"
//
(* ****** ****** *)

fun Wormlike_worm_initize(): void = "mac#"
fun Wormlike_keyboard_initize(): void = "mac#"

(* ****** ****** *)

(* end of [Wormlike.sats] *)
