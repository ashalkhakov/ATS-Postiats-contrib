(*
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
** OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
** NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
** HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
** WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
** FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
** OTHER DEALINGS IN THE SOFTWARE.
*)

(* ****** ****** *)

(*
** A parsing combinator library
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: February, 2014
//
(* ****** ****** *)
//
abstype
parser_type (t: t@ype, a: t@ype)
//
typedef parser (t: t@ype, a:t@ype) = parser_type (t, a)
//
(* ****** ****** *)
//
fun
{t:t0p}
{a1,a2:t0p}
seq_parser_parser
(
  p1: parser (t, a1)
, p2: parser (t, a2)
) : parser (t, (a1,a2)) 
//
(* ****** ****** *)
//
fun
{t:t0p}
{a,b:t0p}
seq1wth_parser_cloref
(
  p: parser (t, a)
, f: (a) -<cloref1> b
) : parser (t, b) // end-of-function
//
fun
{t:t0p}
{a1,a2,b:t0p}
seq2wth_parser_cloref
(
  p1: parser (t, a1)
, p2: parser (t, a2)
, f: (a1, a2) -<cloref1> b
) : parser (t, b) // end-of-function
//
fun
{t:t0p}
{a1,a2,a3,b:t0p}
seq3wth_parser_cloref
(
  p1: parser (t, a1)
, p2: parser (t, a2)
, p3: parser (t, a3)
, f: (a1, a2, a3) -<cloref1> b
) : parser (t, b) // end-of-function
//
(* ****** ****** *)

(* end of [parcomb.sats] *)
