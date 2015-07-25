(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
*)

(* ****** ****** *)
//
implement s2rt_int() = S2RTint()
implement s2rt_addr() = S2RTaddr()
implement s2rt_bool() = S2RTbool()
//
implement s2rt_real() = S2RTreal()
implement s2rt_string() = S2RTstring()
//
(* ****** ****** *)

implement
s2rt_is_impred
  (s2t0) = (
//
case+ s2t0 of
| S2RTtype() => true
| S2RTvtype() => true 
//
| S2RTt0ype() => true
| S2RTvt0ype() => true
//
| S2RTprop() => true
| S2RTview() => true
//
| S2RTfun(_, s2t_res) => s2rt_is_impred(s2t_res)
//
| _(*rest-of-S2RT*) => false
//
) (* end of [s2rt_is_impred] *)

(* ****** ****** *)
//
implement
fprint_s2rt
  (out, s2t) =
(
//
case+ s2t of
//
| S2RTint() => fprint! (out, "S2RTint()")
| S2RTaddr() => fprint! (out, "S2RTaddr()")
| S2RTbool() => fprint! (out, "S2RTbool()")
//
| S2RTreal() => fprint! (out, "S2RTreal()")
| S2RTstring() => fprint! (out, "S2RTstring()")
//
| S2RTcls() => fprint! (out, "S2RTcls()")
| S2RTeff() => fprint! (out, "S2RTeff()")
//
| S2RTtup() => fprint! (out, "S2RTtup()")
//
| S2RTtype() => fprint! (out, "S2RTtype()")
| S2RTt0ype() => fprint! (out, "S2RTt0ype()")
//
| S2RTvtype() => fprint! (out, "S2RTvtype()")
| S2RTvt0ype() => fprint! (out, "S2RTvt0ype()")
//
| S2RTprop() => fprint! (out, "S2RTprop()")
| S2RTview() => fprint! (out, "S2RTview()")
//
| S2RTtkind() => fprint! (out, "S2RTtkind()")
//
| S2RTfun
    (s2ts_arg, s2t_res) =>
  fprint! (
    out, "S2RTfun(", s2ts_arg, "; ", s2t_res, ")"
  ) (* end of [S2RTfun] *)
//
| S2RTnamed
    (sym) =>fprint! (out, "S2RTnamed(", sym, ")")
  // end of [S2RTnamed]
//
| S2RTerror() => fprint! (out, "S2RTerror()")
//
) (* end of [fprint_s2rt] *)
//
(* ****** ****** *)

(* end of [patsolve_cnstrnt_s2rt.dats] *)
