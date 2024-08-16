#
#	Simple Terminal config
#		based on RG350 ver https://github.com/jamesofarrell/st-sdl
#

# st version
GIT_SHA_FETCH := $(shell git rev-parse HEAD | cut -c 1-7)
VERSION = "1.0.1-$(shell git rev-parse HEAD | cut -c 1-7)"

# Customize below to fit your system

# paths
PREFIX = /usr

# compiler and linker
CC = ${CROSS_COMPILE}gcc
SYSROOT=/opt/aarch64-linux-gnu-7.5.0-linaro/sysroot

# includes and libs
INCS = -I. -I${SYSROOT}/usr/include/SDL
INCS += -I$(SYSROOT)/usr/include -DTRIMUISP
#LIBS = -L${SYSROOT}/lib -lc -L/root/workspace/TRIMUI_LIBS -lSDL -L${SYSROOT}/usr/lib -lpthread -Wl,-Bstatic,-lutil,-Bdynamic
LIBS = -L${SYSROOT}/lib -lc -L${SYSROOT}/usr/lib -lSDL -lpthread -Wl,-Bstatic,-lutil,-Bdynamic

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" -D_GNU_SOURCE=1 -D_REENTRANT 
CFLAGS += --sysroot=${SYSROOT} -Os -Wall ${INCS} ${CPPFLAGS} -fPIC -std=gnu11 -flto -Wno-unused-result -Wno-unused-variable
LDFLAGS += ${LIBS} -s
