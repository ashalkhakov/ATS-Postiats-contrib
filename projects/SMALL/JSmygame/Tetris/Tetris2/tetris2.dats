(*
** Tetris
*)
(* ****** ****** *)
(*
##myatsccdef=\
patsopt -d $1 | \
atscc2js -o $fname($1)_dats.js -i -
*)
(* ****** ****** *)
//
#define
ATS_STATIC_PREFIX "tetris2_"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "tetris2_initize"

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME/contrib\
/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
staload
"{$LIBATSCC2JS}/SATS/Bacon.js/baconjs.sats"
//
(* ****** ****** *)
//
staload (*opened*) "./tetris.sats"
//
(* ****** ****** *)
//
%{^
//
var
theKeyDowns =
  $(document).asEventStream("keydown")
//
var
theKeyDowns =
theKeyDowns.doAction(".preventDefault")
//
%} // end of ...
//
(* ****** ****** *)
//
%{^
//
var theStage = 0;
var theStageNP = 0;
//
function
theGame_tick(event)
{
  thePiece_handle_if();
  theStage.update(); theStageNP.update(); return;
}
//
function
theGame_initize()
{
  theStage = new createjs.Stage("theGameCanvas_main");
  theStageNP = new createjs.Stage("theGameCanvas_np"); // theNextPiece
  createjs.Ticker.addEventListener("tick", theGame_tick);
}
//
function
theScore_incby(delta)
{
    var
    score_well =
    document.getElementById("score_well");
    score_well.innerHTML =
    String(parseInt(score_well.innerHTML)+delta);
}
function
theScore_reset(score)
{
    document.getElementById("score_well").innerHTML = score;
}
//
%}
//
val () =
theGame_initize() where
  { extern fun theGame_initize(): void = "mac#" }
//
(* ****** ****** *)
//
%{^
//
function
theStage_addChild(x)
{
  theStage.addChild(x.createjs); return;
}
//
function
theStage_removeChild(x)
{
  theStage.removeChild(x.createjs); return;
}
//
function
theStageNP_addChild(x)
{
  theStageNP.addChild(x.createjs); return;
}
//
function
theStageNP_removeChild(x)
{
  theStageNP.removeChild(x.createjs); return;
}
//
%} // end of [%{^]
//
(* ****** ****** *)

local
//
val
theGameStatus = ref{int}(0)
//
in (* in-of-local *)

implement
theGameStatus_get() = theGameStatus[]
implement
theGameStatus_set(x) = theGameStatus[] := x

end // end of [local]  
  
(* ****** ****** *)

local
//
val
theGameTQuota0 = ref{double}(100.0)
val
theGameTQuota_left = ref{double}(100.0)
val
theGameTQuota_delta0 = ref{double}(15.0)
val
theGameTQuota_delta1 = ref{double}(15.0)
//
in
//
implement
theGameTQuota_get() = theGameTQuota_left[]
//
implement
theGameTQuota_reset
  ((*void*)) =
{
  val () = theGameTQuota_left[] := theGameTQuota0[]
}
implement
theGameTQuota_update
  ((*void*)) = let
  val left = theGameTQuota_left[]
in
  theGameTQuota_left[] := left - theGameTQuota_delta1[]
end // end of [theGameTQuota_update]
//
implement
theGameTQuota_delta_space
  ((*void*)) =
{
  val () = theGameTQuota_delta1[] := 101.0
}
implement
theGameTQuota_delta_reset
  ((*void*)) =
{
  val () = theGameTQuota_delta1[] := theGameTQuota_delta0[]
}
//
end // end of [local]

(* ****** ****** *)

local

val nprev = ref{int}(0)

in (* in-of-local *)

fun
theScore_getinc_delta
  ((*void*)): int = let
  val np = nprev[]
  val () = nprev[] := np + 1
in
  case+ np of
  | 1 => 20 | 2 => 40 | 3 => 80 | _ => 10
end // end-of-function

fun theScore_reset_delta(): void = nprev[] := 0

end // end of [local]

(* ****** ****** *)
//
extern
fun
thePiece_handle(): void = "mac#"
implement
thePiece_handle() = let
//
val P0 = thePiece_get()
//
val moved = Piece_ymove_dn(P0)
//
val () = if not(moved) then Piece_dump_blocks(P0)
val () = if not(moved) then theGameTQuota_delta_reset()
val () = if not(moved) then thePiece_theNextPiece_update()
//
in
  // nothing
end // end of [thePiece_handle]
//
extern
fun
thePiece_handle_if(): void = "mac#"
implement
thePiece_handle_if() =
(
//
if
theGameStatus_get() > 0
then let
  val rowdel = theGameBoard_rowdel_one()
in
//
if
(rowdel)
then let
  val delta = theScore_getinc_delta()
in
  $extfcall(void, "theScore_incby", delta)
end // end of [then]
else let
  val () =
    theScore_reset_delta()
  // end of [val]
  val () =
    theGameTQuota_update()
  // end of [val]
  val tq = theGameTQuota_get()
in
//
if
tq > 0.0
then ((*void*))
else (theGameTQuota_reset(); thePiece_handle())
//
end // end of [else]
//
end // end of [then]
//
) (* end of [thePiece_handle_if] *)
//
(* ****** ****** *)
//
implement
theGame_play() =
if
(theGameStatus_get() = 0)
then
{
//
  val () = theGameBoard_clear()
  val () = theGameStatus_set(1)
//
  val () = thePiece_theNextPiece_update()
//
  val () = theScore_reset_delta()
//
  val () = $extfcall(void, "theScore_reset", 0)
//
}
//
(* ****** ****** *)
//
implement
theGame_stop() =
{
  val () = theGameStatus_set(0)
  val () = thePiece_dump_blocks()
  val () = theGameTQuota_reset()
}
//
(* ****** ****** *)
//
local
#include "./tetris2_block.dats"
in (*nothing*) end
//
local
#include "./tetris2_piece.dats"
in (*nothing*) end
//
local
#include "./tetris2_keyboard.dats"
in (*nothing*) end
//
local
#include "./tetris2_gameboard.dats"
in (*nothing*) end
//
(* ****** ****** *)

(* end of [tetris2.dats] *)
