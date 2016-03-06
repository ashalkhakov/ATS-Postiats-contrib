(*
** Basis for g-session types
*)

(* ****** ****** *)

staload "./intset.sats"

(* ****** ****** *)
//
abstype
session_msg(int, int, vt@ype)
//
(* ****** ****** *)

abstype ssession_nil
abstype ssession_cons (a:type, ss:type)

(* ****** ****** *)
//
stadef msg = session_msg
//
stadef nil = ssession_nil
//
stadef :: = ssession_cons
stadef cons = ssession_cons
//
(* ****** ****** *)
//
absvtype
channel0_vtype(a:vt@ype)
stadef channel0 = channel0_vtype
//
(* ****** ****** *)
//
absvtype
channel1_vtype
  (iset, int, ssn:type) = ptr
//
stadef channel1 = channel1_vtype
//
vtypedef
cchannel1(G:iset, n:int, ssn:type) = channel1(ncomp(G, n), n, ssn)
//
(* ****** ****** *)

fun
{a:vt0p}
channel1_close{G:iset}{n:int}{ss:type}(channel1(G, n, nil)): void

(* ****** ****** *)
//
fun
{a:vt0p}
channel1_send
  {n:int}{ssn:type}{G:iset}
  {i,j:int | i < n; j < n; ismbr(G, i); ~ismbr(G, j)}
(
  !channel1(G, n, msg(i, j, a)::ssn) >> channel1(G, n, ssn), int(i), int(j), a
) : void // end of [channel1_send]
//
fun
{a:vt0p}
channel1_recv
  {n:int}{ssn:type}{G:iset}
  {i,j:int | i < n; j < n; ~ismbr(G, i); ismbr(G, j)}
(
  !channel1(G, n, msg(i, j, a)::ssn) >> channel1(G, n, ssn), int(i), int(j), &a? >> a
) : void // end of [channel1_recv]
//
fun
{a:vt0p}
channel1_recv_val
  {n:int}{ssn:type}{G:iset}
  {i,j:int | i < n; j < n; ~ismbr(G, i); ismbr(G, j)}
  (!channel1(G, n, msg(i, j, a)::ssn) >> channel1(G, n, ssn), int(i), int(j)): (a)
//
(* ****** ****** *)
//
(*
//
typedef
session_snd(a:vt@ype) = session_msg(0, 1, a)
typedef
session_rcv(a:vt@ype) = session_msg(1, 0, a)
//
stadef snd = session_snd
stadef rcv = session_rcv
//
vtypedef
chanpos(ssn:type) = channel1(iset(0), 2, ssn)
vtypedef
channeg(ssn:type) = channel1(iset(1), 2, ssn)
//
fun
{a:vt0p}
chanpos_send{ssn:type}
  (!chanpos(snd(a)::ssn) >> chanpos(ssn), a): void
//
fun
{a:vt0p}
chanpos_recv{ssn:type}
  (!chanpos(rcv(a)::ssn) >> chanpos(ssn), &a? >> a): void
//
fun
{a:vt0p}
channeg_recv{ssn:type}
  (!channeg(rcv(a)::ssn) >> chanpos(ssn), a): void
//
fun
{a:vt0p}
chanpos_send{ssn:type}
  (!channeg(snd(a)::ssn) >> chanpos(ssn), &a? >> a): void
*)
//
(* ****** ****** *)
//
fun{} channel_cap(): intGte(1)  
//
(* ****** ****** *)
//
fun{}
channel1_link
  {n:int}{ss:type}
  {G1,G2:iset | isnil(G1*G2)}
  (channel1(G1, n, ss), channel1(G2, n, ss)): channel1(G1+G2, n, ss)
//
fun{}
cchannel1_link
  {n:int}{ss:type}
  {G1,G2:iset | isnil(G1*G2)}
  (cchannel1(G1, n, ss), cchannel1(G2, n, ss)): cchannel1(G1+G2, n, ss)
//
(* ****** ****** *)
//
fun{}
cchannel1_create_exn
  {n:int}{ss:type}{G:iset}
  (fserv: channel1(G, n, ss) -<lincloptr1> void): cchannel1(G, n, ss)
//
(* ****** ****** *)

(* end of [basis.sats] *)
