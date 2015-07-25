(*
** Lists
*)

(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload
  "./../SATS/basis.sats"
//
staload "./../SATS/list.sats"
//
(* ****** ****** *)
//
staload "./basis_chan2.dats"
//
(* ****** ****** *)

implement
{}(*tmp*)
chanpos_list_nil
  (chpos) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val
chan2 =
$UN.castvwtp1{chan2}(chpos)
//
val () =
channel2_send (chan2, $UN.int2ptr(0))
//
prval () = $UN.cast2void(chan2)
//
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_list_nil] *)

(* ****** ****** *)

implement
{}(*tmp*)
chanpos_list_cons
  (chpos) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp1{chan2}(chpos)
//
val ((*void*)) =
  channel2_send (chan2, $UN.int2ptr(1))
//
prval () = $UN.cast2void(chan2)
//
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_list_cons] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_list
  (chneg) = let
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp1{chan2}(chneg)
//
val tag = channel2_recv_val (chan2)
//
prval () = $UN.cast2void(chan2)
//
in
//
if
iseqz(tag)
then let
  prval () = $UN.castview2void(chneg) in channeg_list_nil()
end // end of [then]
else let
  prval () = $UN.castview2void(chneg) in channeg_list_cons()
end // end of [else]
//
end // end of [channeg_list]

(* ****** ****** *)

implement
{a}(*tmp*)
list2sslist(xs) = let
//
fun
fserv
(
  chp: chanpos(sslist(a)), xs: List(a)
) : void =
(
case+ xs of
| list_nil () => let
    val () = chanpos_list_nil(chp) in chanpos_nil_wait(chp)
  end // end of [list_nil]
| list_cons (x, xs) => let
    val () = chanpos_list_cons(chp) in chanpos_send(chp, x); fserv(chp, xs)
  end // end of [list_cons]
)
//
in
//
channeg_create_exn(llam(chp) => fserv(chp, xs))
//
end // end of [list2sslist]

(* ****** ****** *)

implement
{a}(*tmp*)
sslist2list(chn) = list_vt2t(sslist2list_vt(chn))

(* ****** ****** *)

implement
{a}(*tmp*)
list2sslist_vt(xs) = let
//
fun
fserv
(
  chp: chanpos(sslist(a)), xs: List_vt(a)
) : void =
(
case+ xs of
| ~list_vt_nil () => let
    val () = chanpos_list_nil(chp) in chanpos_nil_wait(chp)
  end // end of [list_nil]
| ~list_vt_cons (x, xs) => let
    val () = chanpos_list_cons(chp) in chanpos_send(chp, x); fserv(chp, xs)
  end // end of [list_cons]
)
//
in
//
channeg_create_exn(llam(chp) => fserv(chp, xs))
//
end // end of [list2sslist_vt]

(* ****** ****** *)

implement
{a}(*tmp*)
sslist2list_vt
  (chn) = let
//
fun
loop
(
  chn: channeg(sslist(a))
, res: &ptr? >> List0_vt(a)
) : void = let
//
val opt = channeg_list(chn)
//
in
//
case+ opt of
| channeg_list_nil() =>
  (
    res := list_vt_nil();
    channeg_nil_close(chn)
  ) (* end of [channeg_list_nil] *)
| channeg_list_cons() =>
  {
    val x =
      channeg_send_val(chn)
    val () =
      res := list_vt_cons{a}{0}(x, _)
    val+list_vt_cons(_, res1) = res
    val ((*void*)) = loop (chn, res1)
    prval ((*fold*)) = fold@res
  } (* end of [channeg_list_cons] *)
//
end // end of [loop]
//
var res: ptr // uninitialized
//
in
  loop(chn, res); res
end // end of [sslist2list_vt]

(* ****** ****** *)

(* end of [list.dats] *)
