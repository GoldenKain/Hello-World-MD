Palette:
    dc.w 0x0000 ; Transparent
    dc.w 0x0000 ; Black
    dc.w 0x0EEE ; White
    dc.w 0x000E ; Red
    dc.w 0x00E0 ; Green
    dc.w 0x0E00 ; Blue
    dc.w 0x0E0E ; Pink
    dc.w 0x0000
    dc.w 0x0000
    dc.w 0x0000
    dc.w 0x0000
    dc.w 0x0000
    dc.w 0x0000
    dc.w 0x0000
    dc.w 0x0000
    dc.w 0x0000

CharacterH:
    dc.l 0x11000110
    dc.l 0x11000110
    dc.l 0x11000110
    dc.l 0x11111110
    dc.l 0x11000110
    dc.l 0x11000110
    dc.l 0x11000110
    dc.l 0x00000000

CharacterE:
    dc.l 0x11111110
    dc.l 0x11000000
    dc.l 0x11000000
    dc.l 0x11111110
    dc.l 0x11000000
    dc.l 0x11000000
    dc.l 0x11111110
    dc.l 0x00000000

CharacterL:
    dc.l 0x11000000
    dc.l 0x11000000
    dc.l 0x11000000
    dc.l 0x11000000
    dc.l 0x11000000
    dc.l 0x11000000
    dc.l 0x11111110
    dc.l 0x00000000

CharacterO:
    dc.l 0x01111100
    dc.l 0x11000110
    dc.l 0x10000010
    dc.l 0x10000010
    dc.l 0x10000010
    dc.l 0x11000110
    dc.l 0x01111100
    dc.l 0x00000000

CharacterW:
    dc.l 0x10000010
    dc.l 0x10000010
    dc.l 0x10000010
    dc.l 0x10010010
    dc.l 0x01010100
    dc.l 0x01101100
    dc.l 0x01000100
    dc.l 0x00000000

CharacterR:
    dc.l 0x11111000
    dc.l 0x11001100
    dc.l 0x11001100
    dc.l 0x11111000
    dc.l 0x11011100
    dc.l 0x11000110
    dc.l 0x11000010
    dc.l 0x00000000

CharacterD:
    dc.l 0x11111000
    dc.l 0x11001100
    dc.l 0x11000010
    dc.l 0x11000010
    dc.l 0x11000010
    dc.l 0x11001100
    dc.l 0x11111000
    dc.l 0x00000000

AddTileToVDP: macro character, addr
    SetVRAMWrite \addr
    move.l \character, a0
    move.w #0x7, d0
    bsr CharLp
    endm

CharLp:
    move.l (a0)+, vdp_data
    dbra d0, CharLp
    rts