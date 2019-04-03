(* ****** ****** *)
//
// HX: 2016-08-08:
// Some PAGEN-functions
// for creating Midterms
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

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
extern
fun{}
PAGENmidterm_head(): void
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENmidterm_head() =
{
//
val () =
gprintln! ("<head>")
//
val () =
gprintln! ("\
<title>BUCASCS320-midterm-1</title>\
") (* gprintln! *)
//
val () =
gprintln! ("\
<meta content=\"text/html; charset=UTF-8\" />\
") (* end of [val] *)
//
val () =
gprintln! ("\
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\
") (* end of [val] *)
//
val () =
gprintln! ("\
<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">
") (* end of [val] *)
//
val () =
gprintln! ("\
<style type=\"text/css\">
  .patsyntax {width:100%;margin:auto;}
  .patsyntax {color:#808080;background-color:#E0E0E0;}
  .patsyntax span.keyword {color:#000000;font-weight:bold;}
  .patsyntax span.comment {color:#787878;font-style:italic;}
  .patsyntax span.extcode {color:#A52A2A;}
  .patsyntax span.neuexp  {color:#800080;}
  .patsyntax span.staexp  {color:#0000F0;}
  .patsyntax span.prfexp  {color:#603030;}
  .patsyntax span.dynexp  {color:#F00000;}
  .patsyntax span.stalab  {color:#0000F0;font-style:italic}
  .patsyntax span.dynlab  {color:#F00000;font-style:italic}
  .patsyntax span.dynstr  {color:#008000;font-style:normal}
  .patsyntax span.stacstdec  {text-decoration:none;}
  .patsyntax span.stacstuse  {color:#0000CF;text-decoration:underline;}
  .patsyntax span.dyncstdec  {text-decoration:none;}
  .patsyntax span.dyncstuse  {color:#B80000;text-decoration:underline;}
  .patsyntax span.dyncst_implement  {color:#B80000;text-decoration:underline;}
</style>\
") (* gprintln! *)
//
val () =
gprintln! ("\
<script
 src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js\">
</script>
<script
 src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\">
</script>
<script
 src=\"https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2014-11-29/FileSaver.min.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/libatscc2js/libatscc2js_all.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/libatscc2js/libatscc2js_print_store_cats.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/ats2langweb/pats2xhtmlize_dats.js\">
</script>\
") (* gprintln! *)
//
val () =
gprintln! ("</head>")
//
} (* end of [PAGENmidterm_head] *)
//
(* ****** ****** *)
//
extern
fun{}
patsopt_tc_button(key: string): void
extern
fun{}
patsopt_cc_button(key: string): void
extern
fun{}
patsopt_cc2js_button(key: string): void
//
extern
fun{} pats2xhtml_button(key: string): void
//
(* ****** ****** *)
//
implement
{}(*tmp*)
patsopt_tc_button(key) =
{
//
val () =
gprintln!("\
<button
 type=\"button\"
 id=\"")(key)("_patsopt_tc_button\"
 onclick=\"assign02_patsopt_tc_onclick('")(key)("')\"
>patsopt_tc</button>\
") (* gprintln! *)
//
} (* end of [patsopt_tc_button] *)
//
implement
{}(*tmp*)
patsopt_cc_button(key) =
{
//
val () =
gprintln!("\
<button
 type=\"button\"
 id=\"")(key)("_patsopt_cc_button\"
 onclick=\"assign02_patsopt_cc_onclick('")(key)("')\"
>patsopt_cc</button>\
") (* gprintln! *)
//
} (* end of [patsopt_cc_button] *)
//
implement
{}(*tmp*)
patsopt_cc2js_button(key) =
{
//
val () =
gprintln!("\
<button
 type=\"button\"
 id=\"")(key)("_patsopt_cc2js_button\"
 onclick=\"assign02_patsopt_cc2js_onclick('")(key)("')\"
>patsopt_cc2js</button>\
") (* gprintln! *)
//
} (* end of [patsopt_cc2js_button] *)
//
implement
{}(*tmp*)
pats2xhtml_button(key) =
{
//
val () =
gprintln! ("\
<button
 type=\"button\"
 id=\"")(key)("_pats2xhtml_button\"
 onclick=\"assign02_pats2xhtml_toggle_onclick('")(key)("')\"
>pats2xhtml-toggle</button>\
") (* gprintln! *)
//
} (* pats2xhtml_button *)
//
(* ****** ****** *)
//
extern
fun{}
patssrc_saveAs_button(key: string): void
extern
fun{}
patssrc_saveAs_input0(key: string): void
extern
fun{}
patsout_saveAs_button(key: string): void
extern
fun{}
patsout_saveAs_input0(key: string): void
//
(* ****** ****** *)
//
implement
{}(*tmp*)
patssrc_saveAs_button(key) =
{
//
val () =
gprintln! ("\
<button
 type=\"button\"
 id=\"")(key)("_patssrc_saveAs_button\"
 onclick=\"assign02_patssrc_saveAs_onclick('")(key)("')\"
>saveAs</button>\
") (* gprintln! *)
//
} (* patssrc_saveAs_button *)

implement
{}(*tmp*)
patssrc_saveAs_input0(key) =
{
//
val () =
gprintln! ("\
<input
 type=\"text\"
 id=\"")(key)("_patssrc_saveAs_input\"
 size=18 maxlength=32
 placeholder=\"")(key)(".dats\"></input>\
") (* gprintln! *)
//
} (* patssrc_saveAs_input0 *)
//
implement
{}(*tmp*)
patsout_saveAs_button(key) =
{
//
val () =
gprintln! ("\
<button
 type=\"button\"
 id=\"")(key)("_patsout_saveAs_button\"
 onclick=\"assign02_patsout_saveAs_onclick('")(key)("')\"
>saveAs</button>\
") (* gprintln! *)
//
} (* patsout_saveAs_button *)
//
(* ****** ****** *)
//
extern
fun{}
PAGENmidterm_source_table$rows(): int
implement
{}(*tmp*)
PAGENmidterm_source_table$rows() = 24
//
extern
fun{}
PAGENmidterm_source_table$cols(): int
implement
{}(*tmp*)
PAGENmidterm_source_table$cols() = 80
//
extern
fun{}
PAGENmidterm_source_table
(
  key: string, source: string
) : void // end-of-function
//
implement
{}(*tmp*)
PAGENmidterm_source_table
  (key, source) = let
//
val rows =
PAGENmidterm_source_table$rows()
val cols =
PAGENmidterm_source_table$cols()
//
val () =
gprintln!
(
"<table class=\"table\">"
) (* gprintln! *)
//
val () =
gprintln! ("\
<thead>
<tr>
<th class=\"text-center\" width=\"50%\">Source</th>
<th class=\"text-center\" width=\"50%\">Output</th>
</tr>
</thead>
") (* gprintln! *)
//
val () =
gprintln! ("\
<tbody>
<tr>
<td align=\"center\">\
")
//
val () =
patssrc_saveAs_button(key)
val () =
patssrc_saveAs_input0(key)
//
val () =
gprintln! ("\
</td>
<td align=\"center\">\
") (* gprintln! *)
//
(*
val () =
patsout_saveAs_button(key)
*)
//
val () =
gprintln! ("\
</td>
</tr>\
") (* gprintln! *)
//
val () =
gprintln!
("\
<tr
 id=\"")(key)("_table_tr1\">
<td align=\"center\">
<textarea
 id=\"")(key)("_source\"
 rows=")(rows)(" cols=")(cols)("
 spellcheck=\"false\">\
") (* gprintln! *)
//
val () = gprint_string(source)
//
val () =
gprintln!
("\
</textarea>
</td>
<td align=\"center\">
<textarea
 id=\"")(key)("_output\"
 rows=0 cols=0
 spellcheck=\"false\"
 placeholder=\"The output goes here...\">
</textarea>
</td>
</tr>\
") (* gprintln! *)
//
val () =
gprintln! ("\
<tr
 id=\"")(key)("_table_tr2\"
 hidden=\"hidden\">
<td align=\"center\">
<pre
 class=\"text-left\"
 id=\"")(key)("_source2\">source2
</pre>
</td>
<td align=\"center\">
<div
 class=\"text-left\"
 id=\"")(key)("_output2\">output2
</div>
</td>
</tr>\
") (* gprintln! *)
//
val () =
gprintln! ("\
<tr>
<td align=\"center\">\
")
//
val () = patsopt_tc_button(key)
val () = patsopt_cc_button(key)
val () = patsopt_cc2js_button(key)
val () = pats2xhtml_button(key)
//
val () =
gprintln! ("\
</td>
<td></td>
</tr>
</tbody>\
") (* gprintln! *)
//
val () =
gprintln! ("</table>")
//
in
  // nothing
end // end of [PAGENmidterm_code_table]
//
(* ****** ****** *)

(* end of [PAGEN-midterm.dats] *)
