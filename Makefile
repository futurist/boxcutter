# Makefile for boxcutter
# 1. Need mingw+msys+mingw developer toolkit
# 2. git clone git://source.winehq.org/git/wine.git wine-git
# run this in msys with "make"

VERSION = 1.6

FILES = boxcutter.cpp \
	boxcutter-fs.cpp \
	bmp.cpp \
	png.cpp \
	boxcutter.exe \
	boxcutter-fs.exe \
	Makefile \
	README.txt \
	COPYING.LESSER \
	LICENSE \
	gdi
CC=g++

WWW = /var/www/dev/rasm/boxcutter/download

CFLAGS=-mwindows -lcomctl32 -lgdi32 -I$(pwd)/include/msvcrt -Lgdi -lgdiplus

all: boxcutter.exe boxcutter-fs.exe

boxcutter.exe: boxcutter.cpp bmp.cpp png.cpp
	$(CC) boxcutter.cpp -o boxcutter $(CFLAGS)

boxcutter-fs.exe: boxcutter-fs.cpp
	$(CC) boxcutter-fs.cpp -o boxcutter-fs $(CFLAGS)


pkg: $(FILES)
	mkdir -p dist
	rm -rf dist/boxcutter-$(VERSION)
	mkdir -p dist/boxcutter-$(VERSION)
	cp -r $(FILES) dist/boxcutter-$(VERSION)
	cd dist && zip -r boxcutter-$(VERSION).zip boxcutter-$(VERSION)

upload:
	cp -r dist/boxcutter-$(VERSION).zip \
              dist/boxcutter-$(VERSION) $(WWW)

clean:
	rm -f boxcutter.exe boxcutter-fs.exe



