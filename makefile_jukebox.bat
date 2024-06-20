 	ISAS32.exe -w 2  -t jukebox_engine.asm -o audio.o
	ISLK32.exe audio.o -t -v -map -o audio.isx

pause
	
