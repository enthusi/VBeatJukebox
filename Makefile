SOURCE=vbeatjukebox.asm
EMU=mednafen

vbeatjukebox.vb: $(SOURCE) 
	./isas -w 2  -t $(SOURCE) -o vbeatjukebox.o
	./islk vbeatjukebox.o -t -v -map -o vbeatjukebox.isx
	./isx2vb vbeatjukebox.isx vbeatjukebox.vb

run: vbeatjukebox.vb
	$(EMU)  vbeatjukebox.vb
