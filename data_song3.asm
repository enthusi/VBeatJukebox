;all sources Licensed under the 3-Clause BSD License
;Copyright 2021, Martin 'enthusi' Wendt / PriorArt
;-----------------------------------------------------------
;following stuff is based of the demo tune and informations on github
;composed by tronimal

;mw23: 
;METHOD 1: put this table into RAM and have it overwritten for every new song
;        issue: we can not have multiple songdata.asm at compile time

;METHOD 2: have the whole song in RAM and push ALL data to RAM from ROM for each song

_SONG_TABLE
	dw _COL_TABLE         ;0 fixed length
	dw _WAVESET_TABLE     ;4 fixed length possibly
	dw _INSTRUMENT_TABLE  ;8 fixed length possibly MAY VARY
	dw _MY_WAVE_0         ;12 points to raw wave data MAY VARY
	dw _PLAYLIST          ;16 VARIABLE
	dw _CHANNEL_TABLE



    EVEN 4
_INSTRUMENT_TABLE 
    dw 0 ;dummy script_instrument0 ;0
	dw _instrument_kick ;1
    dw _instrument_snare ;2
    dw _instrument_chh ;3
    dw _instrument_ohh ;4
    dw _instrument_bass ;5
    dw _instrument_nbass1 ;6
    dw _instrument_nbass2 ;7
    dw _instrument_nbass3 ;8
	dw _instrument_saw1 ;9
    dw _instrument_saw2 ;10
    dw _instrument_saw3 ;11
    dw _instrument_saw4 ;12
    dw _instrument_squ1 ;13
    dw _instrument_squ2 ;14
    dw _instrument_squ3 ;15
    dw _instrument_ksqu4 ;16
	dw _instrument_tri1 ;17
    dw _instrument_tri2 ;18
    dw _instrument_tri3 ;19
    dw _instrument_tri4 ;20
    dw _instrument_nkick ;21
    dw _instrument_nsnare ;22
    dw _instrument_nchh ;23
    dw _instrument_nohh ;24
	dw _instrument_stop ;25
    dw _instrument_short_tri ;26
    dw _instrument_short_saw ;27
	dw _instrument_short_rho ;28	
	dw _instrument_endless_squ ;29
	dw _instrument_strings_squ ;30	
	
;-----------------------------------------------------------    


;-----------------------------------------------------------
        EVEN 4
_WAVESET_TABLE ;call change with instrument 31?
    
    db  0, 1, 2, 3, 4, 0, 0, 0 ;standard
    db -1,-1,-1,-1,-1, 0, 0, 0 ;example change NOTHING -1 = skip
    db -1,-1,-1,-1,-1, 0, 0, 0 ;skip
    db -1,-1,-1,-1,-1, 0, 0, 0 ;skip
    db -1,-1,-1,-1,-1, 0, 0, 0 ;skip
    db -1,-1,-1,-1,-1, 0, 0, 0 ;skip
    db -1,-1,-1,-1,-1, 0, 0, 0 ;skip
    db -1,-1,-1,-1,-1, 0, 0, 0 ;skip
    db -1,-1,-1,-1,-1, 0, 0, 0 ;skip
    db -1,-1,-1,-1,-1, 0, 0, 0 ;skip


       

;------------------------------------------------

        
        EVEN 4
_COL_TABLE       dw _COL_PTR0, _COL_PTR1, _COL_PTR2
                dw _COL_PTR3, _COL_PTR4, _COL_PTR5
                
_COL_OFF_TABLE   dw _COL_OFFSETS0, _COL_OFFSETS1, _COL_OFFSETS2
                dw _COL_OFFSETS3, _COL_OFFSETS4, _COL_OFFSETS5

;----------------------------------------------------
        EVEN 4
_COL_PTR0        
        LIBBIN song3/col_ptr0.dat
        EVEN 4
_COL_PTR1        
        LIBBIN song3/col_ptr1.dat
        EVEN 4
_COL_PTR2
        LIBBIN song3/col_ptr2.dat
        EVEN 4
_COL_PTR3        
        LIBBIN song3/col_ptr3.dat
        EVEN 4
_COL_PTR4        
        LIBBIN song3/col_ptr4.dat
        EVEN 4
_COL_PTR5        
        LIBBIN song3/col_ptr5.dat

;----------------------------------------------------        
        EVEN 4
_COL_OFFSETS0
        LIBBIN song3/col_offsets0.dat
        EVEN 4
_COL_OFFSETS1
        LIBBIN song3/col_offsets1.dat
        EVEN 4
_COL_OFFSETS2
        LIBBIN song3/col_offsets2.dat
        EVEN 4
_COL_OFFSETS3
        LIBBIN song3/col_offsets3.dat
        EVEN 4
_COL_OFFSETS4
        LIBBIN song3/col_offsets4.dat
        EVEN 4
_COL_OFFSETS5
        LIBBIN song3/col_offsets5.dat        
;----------------------------------------------------
;VARYING_DATA_STARTS_HERE ;variable SIZE, the data above might vary from song to song as well of course!
;-----------------------------------------------------------    

        EVEN 4
        
_CHANNEL0
        LIBBIN song3/channel0_stream4.dat
       ; EVEN 4
_CHANNEL1
        LIBBIN song3/channel1_stream4.dat        
       ; EVEN 4
_CHANNEL2
        LIBBIN song3/channel2_stream4.dat        
        ;EVEN 4
_CHANNEL3
        LIBBIN song3/channel3_stream4.dat
        ;EVEN 4
_CHANNEL4
        LIBBIN song3/channel4_stream4.dat        
        ;EVEN 4
_CHANNEL5
        LIBBIN song3/channel5_stream4.dat        
        
        EVEN 4

_CHANNEL_START equ _CHANNEL0        
                
_CHANNEL_TABLE   dw _CHANNEL0-_CHANNEL0+_CHANNEL_START, _CHANNEL1-_CHANNEL0+_CHANNEL_START, _CHANNEL2-_CHANNEL0+_CHANNEL_START
                 dw _CHANNEL3-_CHANNEL0+_CHANNEL_START, _CHANNEL4-_CHANNEL0+_CHANNEL_START, _CHANNEL5-_CHANNEL0+_CHANNEL_START



    EVEN 4
_script_instrument0
    db 1, VOL, 0
    db 0

_instrument_kick ;kickdrum 1
    db 1, HARDNOTE | VOL | WAVE, 24, 1, 63, 0
    db 1, HARDNOTE | VOL, 16, 1, 63
    db 1, HARDNOTE | VOL, 8, 1, 63
    db 1, HARDNOTE | VOL, 4, 1, 59
    db 1, HARDNOTE | VOL, 2, 1, 55
	db 1, HARDNOTE | VOL, 0, 1, 51
    db 1, VOL, 0
    db 0

_instrument_snare ;noise snare 2
    db 1, HARDNOTE | VOL | WAVE, 70, 0, 47, $80
    db 1, HARDNOTE | VOL | WAVE, 60, 0, 47, $80
	db 1, HARDNOTE | VOL | WAVE, 50, 0, 47, $80
	db 1, VOL, 31
	db 1, VOL, 15
	db 2, VOL, 7
	db 3, VOL, 3
	db 1, VOL, 0
    db 0

_instrument_chh ;noise hihat 3
    db 1, HARDNOTE | VOL | WAVE, 96, 0, 16, $80
	db 1, HARDNOTE | VOL | WAVE, 96, 0, 8, $81
	db 1, VOL, 4
	db 1, VOL, 0
    db 0

_instrument_ohh ;noise open hihat 4
    db 1, HARDNOTE | VOL | WAVE, 96, 0, 16, $80
	db 1, HARDNOTE | VOL | WAVE, 96, 0, 16, $81
	db 2, VOL, 12
	db 4, VOL, 8
	db 6, VOL, 4
	db 6, VOL, 2
	db 1, VOL, 0
    db 0

_instrument_bass ;endless 5
    db 1, VOL | WAVE, 63, 1
	db 0

_instrument_nbass1 ;noisebass 6 needs detune for low notes
	db 18, VOL | WAVE | NOTE_OFF | FREQ_OFF, 39, $87, 26, (-3 & $ff)
	db 1, VOL, 0
    db 0

_instrument_nbass2 ;noisebass 7 needs detune for mid notes
	db 18, VOL | WAVE | NOTE_OFF | FREQ_OFF, 39, $87, 26, (-4 & $ff)
	db 1, VOL, 0
    db 0

_instrument_nbass3 ;chh noisebass 8 needs detune for high notes
	db 18, VOL | WAVE | NOTE_OFF | FREQ_OFF, 39, $87, 26, (-5 & $ff)
	db 1, VOL, 0
    db 0

_instrument_saw1 ;endless 9
    db 1, VOL | WAVE, 47, 2	
	db 0

_instrument_saw2 ;short 10
    db 9, VOL | WAVE, 47, 4
	db 1, VOL, 0
	db 0

_instrument_saw3 ;env down 11
    db 9, VOL | WAVE, 63, 2
    db 3, VOL, 47
    db 3, VOL, 31
    db 3, VOL, 15
	db 3, VOL, 7
    db 3, VOL, 3
	db 0	

_instrument_saw4 ;vibrato 12
    db 1, VOL | WAVE, 63, 2
	db 1, VOL, 55
	db 1, VOL, 47
	db 1, VOL, 43
	db 1, VOL, 39
	db 1, VOL, 35
	db 1, VOL, 31
	db 1, VOL, 27
_instrument_saw4_loopstart
	db 3, FREQ_OFF, (8 & $ff)
	db 3, FREQ_OFF, (0 & $ff)
	db 3, FREQ_OFF, (-8 & $ff)
	db 3, FREQ_OFF, (0 & $ff)
	db 3, FREQ_OFF, (8 & $ff)
	db 3, FREQ_OFF, (0 & $ff)
	db 3, FREQ_OFF, (-8 & $ff) 
	db 3, FREQ_OFF, (-0 & $ff)	
_instrument_saw4_loopend
	db 1, LOOPER, (_instrument_saw4_loopend - _instrument_saw4_loopstart) 

_instrument_squ1 ;endless 13
    db 6, VOL | WAVE, 15, 3
	db 6, VOL | WAVE, 3, 1
	db 0
    
_instrument_squ2 ;sweep octave up 14
    db 1, VOL | WAVE, 63, 1
	db 1, VOL | NOTE_OFF, 59, 1
	db 1, VOL | NOTE_OFF, 55, 1
	db 1, VOL | NOTE_OFF, 51, 1
	db 1, VOL | NOTE_OFF, 47, 1
	db 1, VOL | NOTE_OFF, 43, 1
	db 1, VOL | NOTE_OFF, 39, 1
	db 1, VOL | NOTE_OFF, 35, 1
	db 1, VOL | NOTE_OFF, 31, 1
	db 2, VOL | NOTE_OFF, 31, 1
	db 3, VOL | NOTE_OFF, 31, 1
	db 6, VOL | NOTE_OFF, 31, 1
	db 18, VOL | NOTE_OFF, 31, 1
    db 1, VOL, 0	
	db 0	
	
_instrument_squ3 ;strings 15
    db 9, VOL | WAVE, 3, 2
    db 9, VOL, 7
	db 9, VOL, 11
	db 9, VOL, 15
	db 9, VOL, 19
	db 9, VOL, 23
    db 9, VOL, 27
    db 9, VOL, 31
	db 0	
	
_instrument_ksqu4 ;hard kick 16
    db 1, HARDNOTE | VOL | WAVE, 24, 1, 63, 3
    db 1, HARDNOTE | VOL, 16, 1, 63
    db 1, HARDNOTE | VOL, 8, 1, 63
    db 1, HARDNOTE | VOL, 4, 1, 59
    db 1, HARDNOTE | VOL, 2, 1, 55
	db 1, HARDNOTE | VOL, 0, 1, 51
    db 1, VOL, 0
    db 0	
	
_instrument_tri1 ;endless 17
    db 1, VOL | WAVE, 63, 0	
	db 0
	
_instrument_tri2 ;arp 18
    db 6, VOL | WAVE, 63, 1
	db 6, VOL | NOTE_OFF, 59, 5
	db 6, VOL | NOTE_OFF, 55, 2
	db 6, VOL | NOTE_OFF, 51, 5
	db 6, VOL | NOTE_OFF, 47, 5
	db 6, VOL | NOTE_OFF, 43, 2
	db 6, VOL | NOTE_OFF, 39, (-2 & $ff)
	db 6, VOL | NOTE_OFF, 35, (-5 & $ff)
	db 6, VOL | NOTE_OFF, 39, (-5 & $ff)
	db 6, VOL | NOTE_OFF, 43, (-2 & $ff)
	db 6, VOL | NOTE_OFF, 47, (-5 & $ff)
	db 6, VOL | NOTE_OFF, 51, (-5 & $ff)
    db 1, VOL, 0	
	db 0	
	
_instrument_tri3 ;faster strings 19
	db 9, VOL | WAVE, 15, 0
	db 9, VOL, 19
	db 9, VOL, 23
    db 9, VOL, 27
    db 9, VOL, 31
	db 0		
	
_instrument_tri4 ;strings 20
    db 9, VOL | WAVE, 3, 1
    db 9, VOL, 7
	db 9, VOL, 11
	db 9, VOL, 15
	db 9, VOL, 19
	db 9, VOL, 23
    db 9, VOL, 27
    db 9, VOL, 31
	db 0		

_instrument_nkick ;noise kickdrum 21
    db 1, HARDNOTE | VOL | WAVE, 24, 1, 47, $87
    db 1, HARDNOTE | VOL | WAVE, 16, 1, 47, $86
    db 1, HARDNOTE | VOL | WAVE, 8, 1, 47, $85
    db 1, HARDNOTE | VOL | WAVE, 4, 1, 43, $84
    db 1, HARDNOTE | VOL | WAVE, 2, 1, 39, $83
	db 1, HARDNOTE | VOL | WAVE, 0, 1, 35, $82
    db 1, VOL, 0
    db 0

_instrument_nsnare ;noise snare 22
    db 1, HARDNOTE | VOL | WAVE, 84, 2, 63, $80
    db 1, HARDNOTE | VOL | WAVE, 60, 2, 63, $80
    db 1, HARDNOTE | VOL | WAVE, 48, 2, 63, $81
    db 1, HARDNOTE | VOL | WAVE, 26, 2, 63, $81
    db 1, HARDNOTE | VOL | WAVE, 12, 2, 63, $82
    db 1, VOL, 0
    db 0

_instrument_nchh ;noise hihat 23
    db 3, HARDNOTE | VOL | WAVE, 95, 0, 16, $81
	db 1, VOL, 0
    db 0

_instrument_nohh ;noise open hihat 24
    db 1, HARDNOTE | VOL | WAVE, 80, 0, 16, $81
	db 1, HARDNOTE | VOL | WAVE, 60, 0, 16, $81
	db 3, VOL, 12
	db 6, VOL, 8
	db 6, VOL, 4
	db 9, VOL, 2
	db 1, VOL, 0
    db 0

_instrument_stop ;direct stop 25
	db 1, VOL, 0
    db 0
	
_instrument_short_tri ;short 26
    db 6, VOL | WAVE, 47, 0
	db 1, VOL, 0
	db 0	

_instrument_short_saw ;short 27
    db 6, VOL | WAVE, 47, 2
	db 1, VOL, 0
	db 0

_instrument_short_rho ;short 28
    db 6, VOL | WAVE, 47, 4
	db 1, VOL, 0
	db 0

_instrument_endless_squ ;endless 29
    db 3, VOL | WAVE, 47, 3
	db 0

_instrument_strings_squ ;strings 30
    db 9, VOL | WAVE, 3, 3
    db 9, VOL, 7
	db 9, VOL, 11
	db 9, VOL, 15
	db 9, VOL, 19
	db 9, VOL, 23
    db 9, VOL, 27
    db 9, VOL, 31
	db 0
	

        EVEN 4
_MY_WAVE_0
        LIBBIN Waveforms/tri_hex.dat ;d#2 ; 0
        LIBBIN Waveforms/sine_hex.dat ;e-2 ; 1
        LIBBIN Waveforms/saw_hex_smooth.dat ;f-2 ; 2    
        LIBBIN Waveforms/squ_hex_smooth.dat ;f#2 ; 3
		LIBBIN Waveforms/rho_hex.dat ;f#2 ; 4
		                
        EVEN 4
_PLAYLIST
        LIBBIN song3/VBDemo01_playlist.bin
        db  $ff ;end marker
                        
_SONGDATAEND
