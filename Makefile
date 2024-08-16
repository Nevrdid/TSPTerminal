# st - simple terminal
# See LICENSE file for copyright and license details.

include makefiles/config.mk

SRC = $(wildcard src/*.c)

all: options build

options:
	@echo st build options:
	@echo "UNION_PLATFORM = ${UNION_PLATFORM}"
	@echo "PREFIX         = ${PREFIX}"
	@echo "CROSS_COMPILE  = ${CROSS_COMPILE}"
	@echo "SYSROOT        = ${SYSROOT}"
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"
	@echo "SRC      = ${SRC}"
	@echo "VERSION  = ${VERSION}"


build:
	mkdir -p build
	${CC} -o build/SimpleTerminal ${SRC} ${CFLAGS} ${LDFLAGS}

clean:
	@echo cleaning
	rm -rf build

.PHONY: all options clean
