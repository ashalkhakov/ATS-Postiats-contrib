//
// Game-of-24:
// An example of combining ATS2 and PHP5
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start time: the last day of August, 2014
//
(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#define
LIBATSCC2PHP_targetloc
"$PATSHOME\
/contrib/libatscc2php/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2PHP}/staloadall.hats"
//
#staload
"{$LIBATSCC2PHP}/DATS/basics.dats"
//
(* ****** ****** *)

staload "./GameOf24_php.sats"

(* ****** ****** *)

implement echo_tmp<card> = echo_card

(* ****** ****** *)

local

datatype
card_node =
  | CARDint of (int)
  | CARDadd of (card, card)
  | CARDsub of (card, card)
  | CARDmul of (card, card)
  | CARDdiv of (card, card)
// end of [card_node]

where
card = '{
//
card_val= double, card_node= card_node
//
} (* end of [card] *)

assume card_type = card

(* ****** ****** *)

in (* in of [local] *)

(* ****** ****** *)

implement
card_get_val (c) = c.card_val

(* ****** ****** *)

implement
card_make_int (v) = '{
  card_val= int2double (v), card_node= CARDint (v)
} // end of [card_make_int]

(* ****** ****** *)

implement
add_card_card
  (c1, c2) = let
//
val v = c1.card_val + c2.card_val
//
in '{
//
card_val= v, card_node= CARDadd (c1, c2)
//
} end // end of [add_card_card]

(* ****** ****** *)

implement
sub_card_card
  (c1, c2) = let
//
val v = c1.card_val - c2.card_val
//
in '{
//
card_val= v, card_node= CARDsub (c1, c2)
//
} end // end of [sub_card_card]

(* ****** ****** *)

implement
mul_card_card
  (c1, c2) = let
//
val v = c1.card_val * c2.card_val
//
in '{
//
card_val= v, card_node= CARDmul (c1, c2)
//
} end // end of [mul_card_card]

(* ****** ****** *)

implement
div_card_card
  (c1, c2) = let
//
val v = c1.card_val / c2.card_val
//
in '{
//
card_val= v, card_node= CARDdiv (c1, c2)
//
} end // end of [div_card_card]

(* ****** ****** *)

implement
fprint_card
  (out, c0) = let
in
//
case+ c0.card_node of
| CARDint (v) => fprint! (out, "CARDint(", v, ")")
| CARDadd (c1, c2) => fprint! (out, "CARDadd(", c1, ", ", c2, ")")
| CARDsub (c1, c2) => fprint! (out, "CARDsub(", c1, ", ", c2, ")")
| CARDmul (c1, c2) => fprint! (out, "CARDmul(", c1, ", ", c2, ")")
| CARDdiv (c1, c2) => fprint! (out, "CARDdiv(", c1, ", ", c2, ")")
//
end // end of [fprint_card]

(* ****** ****** *)

implement
echo_card (c0) = let
//
implement
echo_tmp<card> = echo_card
//
in
//
case+ c0.card_node of
| CARDint (v) => echo (v)
| CARDadd (c1, c2) => echo ("(", c1, " + ", c2, ")")
| CARDsub (c1, c2) => echo ("(", c1, " - ", c2, ")")
| CARDmul (c1, c2) => echo ("(", c1, " * ", c2, ")")
| CARDdiv (c1, c2) => echo ("(", c1, " / ", c2, ")")
//
end (* end of [echo_card] *)

(* ****** ****** *)

implement
fpprint_card
  (out, c0) = let
//
overload fprint with fpprint_card of 10
//
in
//
case+ c0.card_node of
| CARDint (v) => fprint! (out, v)
| CARDadd (c1, c2) => fprint! (out, "(", c1, " + ", c2, ")")
| CARDsub (c1, c2) => fprint! (out, "(", c1, " - ", c2, ")")
| CARDmul (c1, c2) => fprint! (out, "(", c1, " * ", c2, ")")
| CARDdiv (c1, c2) => fprint! (out, "(", c1, " / ", c2, ")")
//
end // end of [fpprint_card]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local
//
assume
cardset_type = PHParref(card)
//
in (* in-of-local *)
//
implement
cardset_size
  (xs) = PHParref_length (xs)
//
implement
cardset_make_list
  (cs) = let
//
typedef
  res = PHParref(card)
//
fun loop
(
  cs: cardlst, res: res
) : cardset =
(
  case+ cs of
  | list_nil () => res
  | list_cons (c, cs) => let
      val () = PHParref_extend (res, c) in loop (cs, res)
    end // end of [list_cons]
) (* end of [loop] *)
//
in
  loop (cs, PHParref_nil())
end // end of [cardset_make_list]

implement
cardset_get_at (cs, i) = PHParref_get_at (cs, i)

implement
cardset_remove2_add1
  (cs, i, j, c) = cs where
{
//
val i = g1ofg0 (i)
val j = g1ofg0 (j)
val () = assertloc (i >= 0)
val () = assertloc (j >= 0)
val cs = PHParref_copy (cs)
val () = PHParref_unset (cs, i)
val () = PHParref_unset (cs, j)
val cs = PHParref_values (cs)
val () = PHParref_extend (cs, c)
//
} // end of [cardset_remove2_add1]

end // end of [local]

(* ****** ****** *)

local

#define EPSILON 0.1

in (* in-of-local *)

implement
echo_cardlst
  (cs) = let
//
fun auxone
  (c: card): void = let
  val v = card_get_val (c)
in
  echo (c, " = ", double2int(v+EPSILON), "<br>\n")
end // end of [auxone]
//
in
//
case+ cs of
| list_nil () => ()
| list_cons (c, cs) => (auxone (c); echo_cardlst (cs))
//
end // end of [echo_cardlst]

(* ****** ****** *)

implement
fpprint_cardlst
  (out, cs) = let
//
fun fprone
(
  out: PHPfilr, c: card
) : void = let
  val v = card_get_val (c)
in
  fpprint_card (out, c);
  fprintln! (out, " = ", double2int(v+EPSILON))
end // end of [fprone]
//
in
//
case+ cs of
| list_nil () => ()
| list_cons (c, cs) =>
  (
    fprone (out, c); fpprint_cardlst (out, cs)
  ) (* end of [list_cons] *)
//
end // end of [fpprint_cardlst]

end // end of [local]

(* ****** ****** *)
//
#define EPSILON 1E-8
//
fun is0 (v: double): bool = abs(v) < EPSILON
fun isn0 (v: double): bool = abs(v) >= EPSILON
fun is24 (v: double): bool = abs(v - 24.0) < EPSILON
//
(* ****** ****** *)

fun card_isneqz (c: card): bool = isn0(card_get_val(c))

(* ****** ****** *)

extern
fun task_reduce
  (x: cardset, res: List0(cardset)): List0(cardset)
// end of [task_reduce]
extern
fun tasklst_reduce
  (xs: List0(cardset), res: List0(cardset)): List0(cardset)
// end of [tasklst_reduce]

(* ****** ****** *)

implement
task_reduce
  (x, res) = let
//
typedef res = List0(cardset)
//
fun auxdo
(
  x: cardset, i: int, j: int, res: res
) : res = res where
{
//
val ci = x[i] and cj = x[j]
//
typedef cs = cardset
//
val res =
  list_cons{cs}(cardset_remove2_add1 (x, i, j, ci+cj), res)
//
val res =
  list_cons{cs}(cardset_remove2_add1 (x, i, j, ci-cj), res)
val res =
  list_cons{cs}(cardset_remove2_add1 (x, i, j, cj-ci), res)
//
val res =
  list_cons{cs}(cardset_remove2_add1 (x, i, j, ci*cj), res)
//
val res =
(
if card_isneqz (cj)
  then list_cons{cs}(cardset_remove2_add1 (x, i, j, ci/cj), res)
  else res
) : List0(cardset)
//
val res =
(
if card_isneqz (ci)
  then list_cons{cs}(cardset_remove2_add1 (x, i, j, cj/ci), res)
  else res
) : List0(cardset)
//
} (* end of [auxdo] *)
//
fnx loop1
(
  x: cardset, n:int, i: int, res: res
) : res =
(
//
if i+1 < n
  then loop2 (x, n, i, i+1, res) else res
//
) (* end of [loop1] *)
//
and loop2
(
  x: cardset, n:int, i: int, j: int, res: res
) : res = let
in
//
if
j < n
then let
//
val res =
  auxdo (x, i, j, res)
//
in
  loop2 (x, n, i, j+1, res)
end // end of [then]
else loop1 (x, n, i+1, res)
//
end // end of [loop2]
//
in
  loop1 (x, cardset_size(x), 0(*i*), res)
end // end of [task_reduce]

(* ****** ****** *)

implement
tasklst_reduce
  (xs, res) = let
in
//
case+ xs of
| list_cons
    (x, xs) => let
    val res = task_reduce (x, res)
  in
    tasklst_reduce (xs, res)
  end // end of [tasklst_reduce]
| list_nil () => res
//
end // end of [tasklst_reduce]

(* ****** ****** *)

implement
GameOf24_play
  (n1, n2, n3, n4) = let
//
val c1 = card_make_int (n1)
and c2 = card_make_int (n2)
and c3 = card_make_int (n3)
and c4 = card_make_int (n4)
//
fun f (i:int):<cloref1> card =
(
case+ i of
| 0 => c1 | 1 => c2 | 2 => c3 | _ => c4
)
//
#define :: cons
//
val cs =
(
  c1 :: c2 :: c3 :: c4 :: nil()
)
//
val x0 = cardset_make_list (cs)
//
val n0 = cardset_size(x0)
//
val xs1 = list_cons{cardset}(x0, list_nil)
//
val res = list_nil()
val res = tasklst_reduce (xs1, res)
val xs2 = list_reverse (res)
//
val res = list_nil()
val res = tasklst_reduce (xs2, res)
val xs3 = list_reverse (res)
//
val res = list_nil()
val res = tasklst_reduce (xs3, res)
val xs4 = list_reverse (res)
//
val res_sol =
  filter (xs4, list_nil) where
{
  fun
  filter
  (
    xs: List0(cardset), res: cardlst
  ) : cardlst =
    case+ xs of
    | list_nil () => res
    | list_cons (x, xs) => let
        val c = x[0]
        val v = card_get_val (c)
        val res =
        (
          if is24(v) then list_cons (c, res) else res
        ) : cardlst // end of [val]
      in
        filter (xs, res)
      end // end of [list_cons]
} (* end of [where] *) // end of [val]
//
in
  list_reverse (res_sol)
end // end of [GameOf24_play]

(* ****** ****** *)

implement
GameOf24_play2
  (n1, n2, n3, n4) = let
//
val res = GameOf24_play (n1, n2, n3, n4)
//
in
//
case+ res of
//
| list_cons _ => echo_cardlst (res)
//
| list_nil () => echo "No solution is found."
//
end // end of [GameOf24_play2]

(* ****** ****** *)
//
extern
fun
main0_php (): void = "mac#GameOf24_php_main0_php"
//
implement
main0_php () =
{
//
val n1 = 3
and n2 = 3
and n3 = 8
and n4 = 8
//
val out = STDOUT
val res = GameOf24_play (n1, n2, n3, n4)
//
val () =
fprintln! (out, "play(", n1, ", ", n2, ", ", n3, ", ", n4, "):")
val () = fpprint_cardlst (out, res)
//
val n1 = 4
and n2 = 4
and n3 = 10
and n4 = 10
//
val out = STDOUT
val res = GameOf24_play (n1, n2, n3, n4)
//
val () =
fprintln! (out, "play(", n1, ", ", n2, ", ", n3, ", ", n4, "):")
val () = fpprint_cardlst (out, res)
//
val n1 = 5
and n2 = 5
and n3 = 7
and n4 = 11
//
val out = STDOUT
val res = GameOf24_play (n1, n2, n3, n4)
//
val () =
fprintln! (out, "play(", n1, ", ", n2, ", ", n3, ", ", n4, "):")
val () = fpprint_cardlst (out, res)
//
val n1 = 3
and n2 = 5
and n3 = 7
and n4 = 13
//
val out = STDOUT
val res = GameOf24_play (n1, n2, n3, n4)
//
val () =
fprintln! (out, "play(", n1, ", ", n2, ", ", n3, ", ", n4, "):")
val () = fpprint_cardlst (out, res)
//
} (* end of [main0_php] *)
//
(* ****** ****** *)

(* end of [GameOf24_php.dats] *)
