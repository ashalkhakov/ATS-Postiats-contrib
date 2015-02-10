<?php
//
include './fact_dats.php';
include './fact2_dats.php';
include './fibats_dats.php';
include './acker_dats.php';
include './isevn_dats.php';
include './multable_dats.php';
include './twice_dats.php';
include './rtfind_dats.php';
include './rtfind2_dats.php';
include './refcount_dats.php';
include './sieve_lazy_dats.php';
//
require './libatscc2php/CATS/basics_cats.php';
require './libatscc2php/CATS/integer_cats.php';
//
require './libatscc2php/CATS/bool_cats.php';
require './libatscc2php/CATS/float_cats.php';
require './libatscc2php/CATS/string_cats.php';
//
require './libatscc2php/CATS/print_cats.php';
//
require './libatscc2php/CATS/PHPref_cats.php';
require './libatscc2php/CATS/PHParref_cats.php';
//
require './libatscc2php/DATS/list_dats.php';
require './libatscc2php/DATS/stream_dats.php';
require './libatscc2php/DATS/reference_dats.php';
//
echo "fact(10) = "; echo fact(10); echo "\n"; flush();
echo "fact2(10) = "; echo fact2(10); echo "\n"; flush();
echo "fibats(20) = "; echo fibats(20); echo "\n"; flush();
echo "acker(3, 3) = "; echo acker(3, 3); echo "\n"; flush();
echo "isevn(1000) = "; echo isevn(1000); echo "\n"; flush();
echo "isodd(1001) = "; echo isodd(1001); echo "\n"; flush();
//
multable_test();
//
twice_test();
rtfind_test();
rtfind2_test();
//
refcount_dynload(); refcount_test();
//
sieve_lazy_main0_php();
//
?>
