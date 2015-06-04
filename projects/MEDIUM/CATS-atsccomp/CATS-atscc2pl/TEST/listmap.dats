(* ****** ****** *)
//
// HX-2014-11:
// A running example
// from ATS2 to Perl5
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2PL}/staloadall.hats"
//
(* ****** ****** *)
//
implement
list_map (xs, f) =
(
case+ xs of
| list_nil () => list_nil ()
| list_cons (x, xs) => list_cons (f(x), list_map (xs, f))
) (* end of [list_map] *)
//
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
//
extern
fun
test : (int, int) -> List0(int) = "mac#test"
//
implement
test (m, n) = let
  val xs = fromto (m, n)
in
  list_map{int}{int} (xs, lam x => m * n * x)
end // end of [test]
//
(* ****** ****** *)

extern
fun
main0_pl : () -> void = "mac#"
implement
main0_pl () =
{
//
val () = println! ("test(5, 10) = ", test(5, 10))
//
} (* end of [main0_pl] *)

(* ****** ****** *)

%{^
require "./libatscc2pl/libatscc2pl_all.pl";
%}

(* ****** ****** *)

%{$
main0_pl();
%} // end of [%{$]

(* ****** ****** *)

(* end of [listmap.dats] *)
