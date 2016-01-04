(* ****** ****** *)
//
// HX-2015-07:
// A running example
// from ATS2 to Erlang
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)

%{^
%%
-module(fact_dats).
%%
-export([fact/1]).
-export([mytest/0]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-include("$PATSHOMERELOC/contrib/libatscc/libatscc2erl/libatscc2erl_all.hrl").
%%
%} // end of [%{]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2ERL}/basics_erl.sats"
staload
"{$LIBATSCC2ERL}/SATS/integer.sats"
//
(* ****** ****** *)
//
extern
fun fact : int -> int = "mac#fact"
//
implement
fact (n) = if n > 0 then n * fact(n-1) else 1
//
(* ****** ****** *)

%{$
mytest() ->
  N = 10
, io:format("fact(~p) = ~p~n", [N, fact(N)])
. %% mytest()
%} // end of [%{$]

(* ****** ****** *)

(* end of [fact.dats] *)
