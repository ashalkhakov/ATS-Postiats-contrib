(* ****** ****** *)
//
// HX: 2016-08-08:
// Some PAGEN-functions
// for creating assignments  
// 
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#define
LIBATSCC2PY3_targetloc
"$PATSHOME\
/contrib/libatscc2py3/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
staload
"{$LIBATSCC2PY3}/SATS/PYLIBC/random.sats"
staload
"{$LIBATSCC2PY3}/SATS/PYLIBC/datetime.sats"
//
(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./PAGEN-midterm.dats"
//
(* ****** ****** *)
//
extern
fun
midterm_1_create(): void = "mac#"
//
(* ****** ****** *)

implement
midterm_1_create() =
{
//
implement
gprint_string<>
  (x0) = print_string(x0)
//
implement
gprint_newline<> = print_newline
//
val () =
gprintln!("<!DOCTYPE html>")
//
val () = gprintln!("<html>")
//
val () = PAGENmidterm_head()
//
val () = gprintln!("<body>")
val () =
gprintln!
("\
<div
 class=\"container-fluid\">\
") (* gprintln! *)
//
val () =
gprintln!("<div class=\"row\">")
//
val () =
gprintln!
("\
<div class=\"col-md-2\"></div>\
")
//
val () =
gprintln!
("\
<div class=\"col-md-8\">
<center>
<h1>BUCASCS320: Midterm-1</h1>
</center>
") (* gprintln! *)
//
val () =
gprintln!
("\
<p>
We adhere strictly to the standard BU guidelines for academic
integrity. Please note that no collaboration on this take-home exam
is allowed. In particular, sharing code is considered a serious form
of cheating and violators may be reported to BU to face potential
discipline actions.
</p>
") (* gprintln! *)
//
val () =
gprintln!
("\
<center>
<table
 class=\"table\"
 width=\"50%\">
<thead>
<tr>
<th class=\"text-left\">No.</th>
<th class=\"text-center\">Points</th>
<th class=\"text-center\">Score</th>
</tr>
</thead>
<tbody>
<tr>
<td>Q1</td><td class=\"text-center\">10</td><td></td>
</tr>
<tr>
<td>Q2</td><td class=\"text-center\">10</td><td></td>
</tr>
<tr>
<td>Q3</td><td class=\"text-center\">10</td><td></td>
</tr>
<tr>
<td>Total</td><td class=\"text-center\">30</td><td></td>
</tr>
</tbody>
</table>
</center>
")
//
val () = gprintln!
("\
<h2>
<a href=\"./midterm-1-q1_dats.html\">Question 1</a>
(<a href=\"#\" onclick=\"patsoptaas_mycode_trigger(theQuestion1)\">Patsoptaas</a>)
</h2>
<p>
A list is a sublist of another list if the former can be
obtained from removing some elements in the latter. For
instance, (1,3,5) is a sublist of (1,2,3,4,5) but (1,1) is
not a sublist of (1,2,3).  Given two lists ##arg(xs) and ##arg(ys),
the function call ##funcall(\"sublist_test(xs, ys)\") returns true
if and only if ##arg(ys) is a sublist of ##arg(xs).  The interface
for ##fun(\"sublist_test\") is given as follows:
<sats2xhtml>//
fun
sublist_test
  (xs: list0(int), ys: list0(int)): bool
//</sats2xhtml>
</p>
") (* end of [gprintln!] *)
//
val () = gprintln!
("\
<h2>
<a href=\"./midterm-1-q2_dats.html\">Question 2</a>
(<a href=\"#\" onclick=\"patsoptaas_mycode_trigger(theQuestion2)\">Patsoptaas</a>)
</h2>
<p>
The function
##fun(\"list_prefixes\") returns a list
consisting of all the prefixes of a given list.
For instance, given (0, 1, 2), ##fun(\"list_prefixes\")
returns the following list of lists:
((), (0), (0, 1), (0, 1, 2)). The interface of ##fun(\"list_prefixes\")
is given as follows:
<sats2xhtml>//
fun{a:t@ype}
list_prefixes(list0(a)): list0(list0(a))
//</sats2xhtml>
</p>
") (* end of [gprintln!] *)
//
val () = gprintln!
("\
<h2>
<a href=\"./midterm-1-q3_dats.html\">Question 3</a>
(<a href=\"#\" onclick=\"patsoptaas_mycode_trigger(theQuestion3)\">Patsoptaas</a>)
</h2>
<p>
Given a list ##arg(xs) of integers, the function
##fun(\"mylist_submaxord\") returns the longest leftmost
subsequence of ##arg(xs) that is ordered.
For instance,
if ##arg(xs) is (1, 3, 2, 4), then the result is (1, 3, 4);
if ##arg(xs) is (4, 1, 2, 3, 8, 9, 5, 6, 7), then the result
is (1, 2, 3, 5, 6, 7). The interface for ##fun(\"list_submaxord\")
is given as follows:
<sats2xhtml>//
fun
list_submaxord(xs: list0(int)): list0(int)
//</sats2xhtml>
</p>
") (* end of [gprintln!] *)
//
val () = gprintln!("</div><!--col-md-8-->")
//
val () = gprintln!("<div class=\"col-md-2\"></div>")
//
val () = gprintln!("</div><!--row-->")
//
val () = gprintln!("</div><!--containier-fluid-->")
//
val () =
gprintln!("<hr></hr>")
//
val () =
gprintln!("\
<script>
//
var
theQuestion1 =
(`\\
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME \"my_dynload\"
//
#define
LIBATSCC2JS_targetloc
\"$PATSHOME\\
/contrib/libatscc2js/ATS2-0.3.2\"
//
#include
\"{$LIBATSCC2JS}/staloadall.hats\"
//
staload
\"{$LIBATSCC2JS}/SATS/print.sats\"
//
%{$
//
ats2jspre_the_print_store_clear();
my_dynload();
alert(ats2jspre_the_print_store_join());
//
%} // end of [%{$]
//
extern
fun
sublist_test
  (xs: list0(int), ys: list0(int)): bool
//
(*
** Please add your code below this comment:
*)
//
#define :: list0_cons
//
val xs =
1::2::3::4::5::nil0()
//
val ys = 1::3::5::nil0()
//
val () = assertloc(sublist_test(xs, ys))
val () = assertloc(~sublist_test(xs, 1 :: 1 :: nil0()))
//
(*
** Please give your implementation as follows:
*)
`)
var
theQuestion2 =
(`\\
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME \"my_dynload\"
//
#define
LIBATSCC2JS_targetloc
\"$PATSHOME\\
/contrib/libatscc2js/ATS2-0.3.2\"
//
#include
\"{$LIBATSCC2JS}/staloadall.hats\"
//
staload
\"{$LIBATSCC2JS}/SATS/print.sats\"
//
%{$
//
ats2jspre_the_print_store_clear();
my_dynload();
alert(ats2jspre_the_print_store_join());
//
%} // end of [%{$]
//
#define :: list0_cons
//
extern
fun{a:t@ype}
list_prefixes(list0(a)): list0(list0(a))
//
(*
** Please give your implementation as follows:
*)
`)
var
theQuestion3 =
(`\\
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME \"my_dynload\"
//
#define
LIBATSCC2JS_targetloc
\"$PATSHOME\\
/contrib/libatscc2js/ATS2-0.3.2\"
#include
\"{$LIBATSCC2JS}/staloadall.hats\"
//
staload
\"{$LIBATSCC2JS}/SATS/print.sats\"
//
%{$
//
ats2jspre_the_print_store_clear();
my_dynload();
alert(ats2jspre_the_print_store_join());
//
%} // end of [%{$]
//
#define :: list0_cons
//
extern
fun{a:t@ype}
list_prefixes(list0(a)): list0(list0(a))
//
(*
** Please give your implementation as follows:
*)
`);
</script>\
") (* gprintln! *)
//
val () =
gprintln!("\
<script>
//
function
patsoptaas_mycode_trigger
  (mycode)
{
//
var
form =
document.createElement(\"form\");
//
form.setAttribute(\"method\", \"POST\");
/*
//
// HX: data is already encoded
//
form.setAttribute
( \"enctype\"
, \"application/x-www-form-urlencoded\"
); // form.setAttribute
*/
//
form.setAttribute
( \"action\"
, \"http://www.ats-lang.org/SERVER/MYCODE/Patsoptaas_serve.php\"
); // form.setAttribute
//
form.setAttribute(\"target\", \"_blank\");
//
var
input =
document.createElement(\"input\");
//
input.setAttribute(\"type\", \"hidden\");
input.setAttribute(\"name\", \"mycode\");
input.setAttribute(\"value\", encodeURIComponent(mycode));
//
form.appendChild(input); document.body.appendChild(form); form.submit(); return;
//
} /* end of [patsoptaas_mycode_trigger] */
//
</script>\
") (* gprintln! *)
//
val () =
gprintln!("\
<script>
$(document).ready(function(){pats2xhtmlize_process_all();return;});
</script>\
") (* gprintln! *)
//
val () = gprintln!("</body>")
val () = gprintln!("</html>")
//
} (* midterm_1_create *)

(* ****** ****** *)

%{$
//
if __name__ == '__main__': midterm_1_create()
//
%} // end of [%{$]

(* ****** ****** *)

%{^
######
import os
import sys
######
#
from libatscc2py3_all import *
#
######
sys.setrecursionlimit(1000000)
######
%} (* end of [%{^] *)

(* ****** ****** *)

(* end of [midterm-1.dats] *)
