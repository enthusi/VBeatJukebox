SOURCE=vbeatjukebox.asm
EMU=mednafen

audio.vb: $(SOURCE) 
	./isas -w 2  -t $(SOURCE) -o audio.o
	./islk audio.o -t -v -map -o audio.isx
	./isx2vb audio.isx audio.vb

run: audio.vb
	$(EMU)  audio.vb
