/*
** Firmata library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_FIRMATA
#define ARDUINO_CATS_FIRMATA

/* ****** ****** */

#include <Firmata.h>

/* ****** ****** */

#define Firmata_ptr (&Firmata)

/* ****** ****** */
//
#define \
Firmata_begin(p0) \
  (static_cast<FirmataClass*>(p0))->begin()
#define \
Firmata_begin_lint(p0, speed) \
  (static_cast<FirmataClass*>(p0))->begin(speed)
//
/* ****** ****** */
//
#define \
Firmata_blinkVersion(p0) \
  (static_cast<FirmataClass*>(p0))->blinkVersion()
#define \
Firmata_printFirmwareVersion(p0) \
  (static_cast<FirmataClass*>(p0))->printFirmwareVersion()
//
#define \
Firmata_setFirmwareVersion(p0, major, minor) \
  (static_cast<FirmataClass*>(p0))->setFirmwareVersion(major, minor)
#define \
Firmata_setFirmwareNameAndVersion(p0, name, major, minor) \
  (static_cast<FirmataClass*>(p0))->setFirmwareVersion((char*)name, major, minor)
//
/* ****** ****** */
//
#define \
Firmata_available(p0) \
  (static_cast<FirmataClass*>(p0))->available()
#define \
Firmata_processInput(p0) \
  (static_cast<FirmataClass*>(p0))->processInput()
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_FIRMATA)

/* ****** ****** */

/* end of [Firmata.cats] */
