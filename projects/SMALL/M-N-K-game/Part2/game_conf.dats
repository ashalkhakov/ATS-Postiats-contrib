(*
** The M-N-K-game
*)

(* ****** ****** *)

#define
ATS_PACKNAME "M_N_K_game"

(* ****** ****** *)

staload "./game.sats"
staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
fprint_conf(out) =
{
  val M = game_conf_get_m()
  val N = game_conf_get_n()
  val K = game_conf_get_k()
  val () = fprintln!(out, "M-N-K is ", M, "-", N, "-", K)
}
 
(* ****** ****** *)

staload M = {
//
typedef T = int
//
fun
initize
(x: &T? >> T): void = x := 0
//
#define
HX_GLOBALS_targetloc
"\
$PATSHOME\
/contrib/atscntrb/atscntrb-hx-globals"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
game_conf_get_m() = $M.get()
implement
game_conf_set_m(m) = $M.set(m)

(* ****** ****** *)

staload N = {
//
typedef T = int
//
fun
initize
(x: &T? >> T): void = x := 0
//
#define
HX_GLOBALS_targetloc
"\
$PATSHOME\
/contrib/atscntrb/atscntrb-hx-globals"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
game_conf_get_n() = $N.get()
implement
game_conf_set_n(n) = $N.set(n)

(* ****** ****** *)

staload K = {
//
typedef T = int
//
fun
initize
(x: &T? >> T): void = x := 0
//
#define
HX_GLOBALS_targetloc
"\
$PATSHOME\
/contrib/atscntrb/atscntrb-hx-globals"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
game_conf_get_k() = $K.get()
implement
game_conf_set_k(k) = $K.set(k)

(* ****** ****** *)

staload
BOARD = {
//
typedef T = ptr
//
fun
initize
(x: &T? >> _): void = x := the_null_ptr
//
#define
HX_GLOBALS_targetloc
"\
$PATSHOME\
/contrib/atscntrb/atscntrb-hx-globals"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
game_conf_get_board() = $UN.cast{board}($BOARD.get())
implement
game_conf_set_board(x) = $BOARD.set($UN.cast{ptr}(x))

(* ****** ****** *)

(* end of [game_conf.dats] *)
