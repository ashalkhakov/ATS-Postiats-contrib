#
# A Simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

CFLAGS += -O2

######

LDFLAGS :=
LDFLAGS += -lgc
LDFLAGS += -L$(PATSLIB) -latslib

######

MALLOCFLAG := -DATS_MEMALLOC_GCBDW

######

SOURCES_SATS += \
  doublet.sats \

SOURCES_DATS += \
  doublet.dats \
  doublet_dict.dats \
  doublet_word.dats \
  doublet_search.dats \

######

MYTARGET=doublet

######

include \
$(PATSHOME)/share/atsmake-post.mk

######

testall:: all
testall:: regress
testall:: cleanall

######

regress:: doublet; ./doublet poor rich
regress:: doublet; ./doublet clean dirty
regress:: doublet; ./doublet wheat bread

######

###### end of [Makefile] ######
