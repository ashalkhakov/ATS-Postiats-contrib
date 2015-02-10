/*
** The prelude for Ardunio
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_HARDWARE_SERIAL
#define ARDUINO_CATS_HARDWARE_SERIAL

/* ****** ****** */

#include <HardwareSerial.h>

/* ****** ****** */

#define Serial_ptr (&Serial)

/* ****** ****** */
//
#define \
HardwareSerial_begin_int(p0, baud) \
  (static_cast<HardwareSerial*>(p0))->begin(baud)
#define \
HardwareSerial_begin_ulint(p0, baud) \
  (static_cast<HardwareSerial*>(p0))->begin(baud)
//
#define \
HardwareSerial_end(p0) (static_cast<HardwareSerial*>(p0))->end()
//
/* ****** ****** */

#define \
HardwareSerial_connected(p0) (static_cast<HardwareSerial*>(p0))->bool()

/* ****** ****** */
//
#define \
HardwareSerial_available(p0) \
  (static_cast<HardwareSerial*>(p0))->available()
//
#define \
HardwareSerial_read(p0) (static_cast<HardwareSerial*>(p0))->read()
#define \
HardwareSerial_peek(p0) (static_cast<HardwareSerial*>(p0))->peek()
//
#define \
HardwareSerial_write_char(p0, char) \
  (static_cast<HardwareSerial*>(p0))->write(char)
//
#define \
HardwareSerial_flush(p0) (static_cast<HardwareSerial*>(p0))->flush()
//
/* ****** ****** */
//
#define \
HardwareSerial_print_int(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_uint(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_lint(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_ulint(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_char(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_uchar(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_double(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_string(p0, x) (static_cast<HardwareSerial*>(p0))->print((char*)x)
//
#define \
HardwareSerial_println(p0) (static_cast<HardwareSerial*>(p0))->println()
#define \
HardwareSerial_println_int(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_uint(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_lint(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_ulint(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_char(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_uchar(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_double(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_string(p0, x) (static_cast<HardwareSerial*>(p0))->println((char*)x)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_HARDWARE_SERIAL)

/* ****** ****** */

/* end of [HardwareSerial.cats] */
