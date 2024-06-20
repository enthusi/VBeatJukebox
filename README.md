# VBeatMachine
This extends the *VirtualBeat Audio Engine* engine by an option to
store multiple songs in ROM and select them via controller.
To facilitate this, some areas of the data management and hence the code needed to be rewritten.
The core functionality and conversion from s3m are identical.
Check *LINK* for the core engine *Vbeat*.
free *VirtualBeat Audio Engine* for the ***Virtual Boy*** console by [PriorArt](http://priorartgames.eu).\
Download zipped 16KB ROM image directly: [VBeat16k_PriorArt.zip](http://martinwendt.de/2021/vbeat/VBeat16k_PriorArt.zip).
## In action
- YouTube recording:\
[![Vbeat on YouTube](http://img.youtube.com/vi/GvSOXE-GMVo/0.jpg)](http://www.youtube.com/watch?v=GvSOXE-GMVo "VirtualBeat Audio Engine for the Virtual Boy")
## Credits
- code: *Martin 'enthusi' Wendt*
- audio: *Yogi (Tronmial)*
- 8x16 font: *Oliver 'v3to' Lindau*
## Specs
- Comes with the full source data (S3M) for 3 example songs.
- The instruments in the S3M are sampled from the actual VBeat instruments on the Virtual Boy
- All featured Instruments are free to use (give credits to Tronimal when they are due)
## Compilation
### LINUX
A simple `make` should suffice, once you prepared all input data
Alternatively you go through the steps for Windows but use WINE and DOSBOX.
### WINDOWS
Run the \
makefile_jukebox.bat, which executes:\
ISAS32.exe -w 2  -t jukebox_engine.asm -o audio.o\
ISLK32.exe audio.o -t -v -map -o audio.isx\
After that, run the following to create the ROM image for Virtual Boy:\
DOSBOX VUIC.EXE audio.isx audio.vb\
Obviously, you need DOSBOX for this.\
The resulting file audio.vb runs in VirtualBoy Emulators such as mednafen, and also can be launched from
any proper ROM Cart solution for the VB.\

# Song conversion
Refer to VBeat. In short:\
- compose your S3M, feel free to learn by editing the provided tunes.\
- convert it into proper data format: `python3 tracker2vb.py yourtune.s3m`.\

