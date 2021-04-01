ROM_Start

    include 'GLOBALS.ASM'
	include 'HEADER.ASM'
    include 'INTERPTS.ASM'
    include 'VDP.ASM'
    include 'GRAPHICS.ASM'

CPU_EntryPoint

    bsr VDP_WriteTMSS ; Get rid of TMSS protection
    bsr VDP_LoadRegisters ; 

    SetCRAMWrite 0x0000 ; Poke adress before trying to write stuff in CRAM
    move.l #Palette, a0 ; Load palette array in register a0

    move.w #0xF, d0 ; counter for the loop
    @PalLp: ; Palette Loop
    move.w (a0)+, vdp_data ; write palette to vdp data with post-incrementing a0 index?
    dbra d0, @PalLp ; decrease and branch as long as d0 isnt negative

    move.w #0x8706, vdp_control ; command 8 to VDP registry 7 (for background color) with color 6 (pink) CRVV

    ; Loading characters in tile registry of VDP
    AddTileToVDP #CharacterH, 0x0020
    AddTileToVDP #CharacterE, 0x0040
    AddTileToVDP #CharacterL, 0x0060
    AddTileToVDP #CharacterO, 0x0080
    AddTileToVDP #CharacterW, 0x00A0
    AddTileToVDP #CharacterR, 0x00C0
    AddTileToVDP #CharacterD, 0x00E0

    SetVRAMWrite 0xC418
    move.w #0x0001, vdp_data
    SetVRAMWrite 0xC41A
    move.w #0x0002, vdp_data
    SetVRAMWrite 0xC41C
    move.w #0x0003, vdp_data
    SetVRAMWrite 0xC41E
    move.w #0x0003, vdp_data
    SetVRAMWrite 0xC420
    move.w #0x0004, vdp_data

    SetVRAMWrite 0xC4A0
    move.w #0x0005, vdp_data
    SetVRAMWrite 0xC4A2
    move.w #0x0004, vdp_data
    SetVRAMWrite 0xC4A4
    move.w #0x0006, vdp_data
    SetVRAMWrite 0xC4A6
    move.w #0x0003, vdp_data
    SetVRAMWrite 0xC4A8
    move.w #0x0007, vdp_data

    @InfiniteLp:
	bra @InfiniteLp

ROM_End