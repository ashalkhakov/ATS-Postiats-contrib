(* ****** ****** *)
//
// HX-2014-08:
// A running example
// from ATS2 to Python3
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PY}/SATS/integer.sats"
//
(* ****** ****** *)
//
extern
fun
listlen
  : {a:t@ype} List0 (a) -> int = "mac#listlen"
//
implement
listlen{a}
  (xs) = let
//
prval () = lemma_list_param (xs)
//
fun
loop{i,j:nat} .<i>.
(
  xs: list (a, i), res: int(j)
) : int(i+j) = let
in
//
case+ xs of
| list_nil () => res | list_cons (_, xs) => loop (xs, res+1)
//
end // end of [loop]
//
in
  loop (xs, 0)
end // end of [intlistlen]

(* ****** ****** *)
//
extern
fun
fromto
  : (int, int) -> List0 (int) = "mac#fromto"
//
implement
fromto (m, n) =
if m < n
  then list_cons (m, fromto (m+1, n)) else list_nil ()
// end of [if]
//
(* ****** ****** *)

%{^
import sys
sys.setrecursionlimit(1000000)
######
from ats2pypre_basics_cats import *
from ats2pypre_integer_cats import *
######
%} // end of [%{^]

(* ****** ****** *)

%{$
xs = fromto(0, 10)
print("listlen(", xs, ") =", listlen(xs))
%} // end of [%{$]

(* ****** ****** *)

(* end of [listlen.dats] *)
