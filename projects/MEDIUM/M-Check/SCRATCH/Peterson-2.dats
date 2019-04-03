(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: December, 2015
//
(* ****** ****** *)

(*
//
// the shared variables, booleans
bool turn, flag[2];
byte ncrit; // number of procs in critical section
//
*)

(* ****** ****** *)

(*
//
// two processes
//
active[2]
proctype user()
{
  assert(_pid == 0 || _pid == 1);
  again:
  flag[_pid] = 1; turn = _pid;
  (flag[1 - _pid] == 0 || turn == 1 - _pid);
//
  ncrit++;
  assert(ncrit == 1); // critical section
  ncrit--;
//
  flag[_pid] = 0; goto again
}
*)

(* ****** ****** *)

staload "./Promela.sats"

(* ****** ****** *)
//
extern
fun
proctype$user{i:nat}(pid(i)): void
//
extern
fun
flag_get{i:two}(pid(i), int(1-i)): bool
and
flag_set{i:two}(pid(i), int( i ), bool): void
//
(* ****** ****** *)
//
extern
fun
turn_get{i:two}(pid(i)): [j:two] int(j)
//
extern
fun turn_set{i,j:two}(pid(i), int(j)): void
//
(* ****** ****** *)

implement
proctype$user(pid) = let
//
val i = pid2int(pid)
//
val ((*void*)) =
  Promela$assert((i=0)+(i=1))
//
fun
loop
(
// argless
) : void = loop() where
{
  val i0 = i
  val i1 = 1 - i
  val () = turn_set(pid, i1)
  val () = flag_set(pid, i0, true)
  val () = if ~flag_get(pid, i1) then turn_set(pid, i0)
  val () = Promela$wait_until(lam() => (turn_get(pid)=i0))
//
// This is a critial section
//
  val () = turn_set(pid, i1)
  val () = flag_set(pid, i0, false)
}
//
in
  loop()
end // end of [proctype$user]

(* ****** ****** *)

(* end of [Peterson-2.dats] *)
