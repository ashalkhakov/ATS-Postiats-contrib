(*
//
// Hello World server
// Binds REP socket to tcp://*:5555
// Expects "Hello" from client, replies with "World"
//
#include <zmq.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

int
main(void)
{
void *context = zmq_ctx_new ();

// Socket to talk to clients
void *responder = zmq_socket (context, ZMQ_REP);
zmq_bind (responder, "tcp://*:5555");

while (1) {
// Wait for next request from client
zmq_msg_t request;
zmq_msg_init (&request);
zmq_msg_recv (&request, responder, 0);
printf ("Received Hello\n");
zmq_msg_close (&request);

// Do some 'work'
sleep (1);

// Send reply back to client
zmq_msg_t reply;
zmq_msg_init_size (&reply, 5);
memcpy (zmq_msg_data (&reply), "World", 5);
zmq_msg_send (&reply, responder, 0);
zmq_msg_close (&reply);
}
// We never get here but if we did, this would be how we end
zmq_close (responder);
zmq_ctx_destroy (context);
return 0;
}
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "{$ZEROMQ}/SATS/zmq.sats"

(* ****** ****** *)

#define nullp the_null_ptr

(* ****** ****** *)

postfix SZ; macdef SZ (i) = g1i2u(,(i))

(* ****** ****** *)

%{^
extern unsigned int sleep (unsigned int) ;
%} // end of [%{^]

(* ****** ****** *)

implement
main0 ((*void*)) = {
//
val
context = zmq_ctx_new ()
val () = assertloc (zmqctx2ptr (context) > nullp)
//
val
responder =
zmq_socket_exn (context, ZMQ_REP)
//
val () =
assertloc
(
  zmq_bind (responder, "tcp://*:5555") >= 0
) (* end of [val] *)
//
val () =
while (true) {
//
// Wait for request from client
//
  var request : zmqmsg_t
  val () = zmq_msg_init_exn (request)
  val _(*nbyte*) = zmq_msg_recv_exn (request, responder, 0)
  val () = println! ("Received 'Hello'")
  val () = zmq_msg_close_exn (request)
//
// Do some 'work'
//
   val _ = $extfcall (uint, "sleep", 1)
//
// Send reply back to client
//
  var reply : zmqmsg_t
  val () =
  zmq_msg_init_size_exn (reply, 5SZ)
  val () =
  $extfcall (void
  , "memcpy", zmq_msg_data(reply), "World", 5
  ) (* end of [val] *)
  val _(*nbyte*) = zmq_msg_send (reply, responder, 0)
  val () = zmq_msg_close_exn (reply)
} (* end of [while] *) // end of [val]
//
val () = zmq_close_exn (responder)
val () = assertloc (zmq_ctx_destroy (context) >= 0)
val ptr = zmqctxopt_unnone (context)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [hwserver.dats] *)
