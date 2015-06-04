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
fib : int -> int = "mac#fib"
//
implement
fib (n) = let
//
fun aux (ff: '(int, int), n: int): int =
  if n > 0 then aux ( '(ff.1, ff.0 + ff.1), n-1 ) else ff.0
//
in
  aux ( '(0, 1), n )
end // end of [fib]
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
if (len(sys.argv) >= 2):
  print(fib(int(sys.argv[1])))
else:
  print('Usage: fib <integer>')
#endif
%} // end of [%{$]

(* ****** ****** *)

(* end of [fib.dats] *)
