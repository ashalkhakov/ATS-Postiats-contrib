(*
** Parsing: ATS/JSON -> UTFPL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#define
LIBJSONC_targetloc
"\
$PATSHOME/contrib\
/atscntrb/atscntrb-hx-libjson-c"
//
(* ****** ****** *)

staload "./../../SATS/utfpl.sats"
staload "./../../SATS/PARSING/parsing.sats"

(* ****** ****** *)
//
staload "{$LIBJSONC}/SATS/json_ML.sats"
//
(* ****** ****** *)
//
extern
fun
the_d2cstmap_find(stamp): d2cstopt_vt
extern
fun
the_d2cstmap_insert(d2c: d2cst): void
//
(* ****** ****** *)

local
//
staload FM =
"libats/SATS/funmap_avltree.sats"
staload _(*FM*) =
"libats/DATS/funmap_avltree.dats"
//
typedef map = $FM.map (stamp, d2cst)
//
var mymap: map = $FM.funmap_nil ()
val the_d2cstmap =
  ref_make_viewptr{map} (view@mymap | addr@mymap)
//
implement
$FM.compare_key_key<stamp> = compare_stamp_stamp
//
in (* in of [local] *)

implement
the_d2cstmap_find
  (k0) = let
//
val
(vbox(pf)|p) =
ref_get_viewptr(the_d2cstmap)
//
in
  $effmask_ref($FM.funmap_search_opt(!p, k0))
end // end of [the_d2cstmap_find]

implement
the_d2cstmap_insert
  (d2c0) = let
//
val k0 = d2c0.stamp()
val (vbox(pf)|p) = ref_get_viewptr(the_d2cstmap)
val-~None_vt ((*void*)) =
  $effmask_ref($FM.funmap_insert_opt(!p, k0, d2c0))
//
in
  // nothing
end // end of [the_d2cstmap_find]

end // end of [local]

(* ****** ****** *)

implement
parse_d2cst
  (jsv0) = let
//
val-~Some_vt(jsv2) =
  jsonval_get_field (jsv0, "d2cst_stamp")
//
val stamp = parse_stamp (jsv2)
//
val opt = the_d2cstmap_find (stamp)
//
in
//
case+ opt of
| ~Some_vt (d2c) => d2c
| ~None_vt ((*void*)) => d2c where
  {
    val-~Some_vt(jsv1) =
      jsonval_get_field (jsv0, "d2cst_sym")
    val sym = parse_symbol (jsv1)
    val d2c = d2cst_make (sym, stamp)
    val ((*void*)) = the_d2cstmap_insert (d2c)
  } (* end of [None_vt] *)
//
end // end of [parse_d2cst]

(* ****** ****** *)
  
implement
parse_d2cstmap
  (jsv0) =
  loop(jsvs) where
{
//
fun
loop
(
  jsvs: jsonvalist
) : void =
(
case+ jsvs of
| list_nil () => ()
| list_cons
    (jsv, jsvs) => let
    val d2c = parse_d2cst(jsv) in loop(jsvs)
  end // end of [list_cons]
)
//
val-JSONarray(jsvs) = jsv0
//
} (* end of [parse_d2cstmap] *)
  
(* ****** ****** *)

(* end of [parsing_d2cst.dats] *)
