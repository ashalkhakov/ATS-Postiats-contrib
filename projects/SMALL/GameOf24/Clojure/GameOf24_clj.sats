(* ****** ****** *)
//
// HX-2016-07-16: for testing atscc2clj
//
(* ****** ****** *)

(*

Given four natural numbers n1, n2, n3 and n4, one chooses two of them and
generates a rational number r1 using either addition, subtraction,
multiplication or division; one mixes r1 with the remaining two numbers and
chooses two of them to generate a rational number r2 using either addition,
subtraction, multiplication or division; one then takes r2 and the last
remaining number to get a rational number r3 using addition, subtraction,
multiplication, or division; if there exists a way to make r3 equal 24, then
we say that (n1, n2, n3, n4) is a good quad.  For instance, (10,10,4,4) is
a good quad since we have

(10 * 10 - 4) / 4 = 24

Similarly, (5,7,7,11) is a good quad since we have

( 5 - 11 / 7) * 7 = 24

Game-of-24 is a game that determines whether four given natural numbers
are a good quad.

*)

(* ****** ****** *)
//
#define
LIBATSCC2CLJ_targetloc
"$PATSHOME\
/contrib/libatscc2clj/ATS2-0.3.2"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2CLJ}/basics_clj.sats"
//
(* ****** ****** *)

abstype card_type
typedef card = card_type

(* ****** ****** *)
//
fun add_card_card (card, card): card
fun sub_card_card (card, card): card
fun mul_card_card (card, card): card
fun div_card_card (card, card): card
//
overload + with add_card_card
overload - with sub_card_card
overload * with mul_card_card
overload / with div_card_card
//
(* ****** ****** *)

fun card_get_val (card): double

(* ****** ****** *)

fun card_make_int (v: int): card

(* ****** ****** *)

typedef cardlst = List0 (card)

(* ****** ****** *)
//
fun
gprint_card (card): void
and
gprint_cardlst (cardlst): void
//
overload gprint with gprint_card
overload gprint with gprint_cardlst of 10
//
fun
gpprint_card (card): void
and
gpprint_cardlst (cardlst): void
//
(*
fun
fprint_card (out: CLJfilr, x: card): void
fun
fprint_cardlst (out: CLJfilr, xs: cardlst): void
//
overload fprint with fprint_card
overload fprint with fprint_cardlst of 10
//
fun
fpprint_card (out: CLJfilr, x: card): void
fun
fpprint_cardlst (out: CLJfilr, xs: cardlst): void
*)
//
(* ****** ****** *)

abstype cardset_type
typedef cardset = cardset_type

(* ****** ****** *)

fun cardset_size (cardset): int

(* ****** ****** *)
//
fun
cardset_get_at
  (cs: cardset, i: int): card
//
overload [] with cardset_get_at
//
(* ****** ****** *)
//
fun
cardset_make_nil (): cardset
fun
cardset_make_list (cardlst): cardset
//
(* ****** ****** *)

fun
cardset_remove2_add1
(
  cs: cardset, i:int, j:int, c: card
) : cardset // end-of-fun

(* ****** ****** *)

fun play24
(
  n1: int, n2: int, n3: int, n4: int
) : List0(card) // end of [play24]

(* ****** ****** *)

(* end of [GameOf24_clj.sats] *)
