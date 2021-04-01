;==============================================================
;   http://www.bigevilcorporation.co.uk
;==============================================================
;   SEGA Genesis Framework (c) Matt Phillips 2014
;==============================================================
;   globals.asm - Defines, and metrics
;==============================================================

; Address of top of stack
stack_top				equ 0x00FFE000

; Size of RAM in bytes (64kb)
size_ram_b				equ 0x0000FFFF

; Start of RAM
ram_start				equ 0x00FF0000

; End of RAM
ram_end					equ (ram_start+size_ram_b)

; Size of RAM
size_ram_b				equ 0x0000FFFF
size_ram_w				equ (size_ram_b/2)
size_ram_l				equ (size_ram_b/4)

; VDP port addresses
vdp_control				equ 0x00C00004
vdp_data				equ 0x00C00000

; VDP commands
vdp_cmd_vram_write		equ 0x40000000
vdp_cmd_cram_write		equ 0xC0000000

; Vertical blanking test bit
vdp_status_vblank		equ 0x3

; Screen width/height
screen_width     		equ 0x0140 ; 320 (H40 mode)
screen_height	        equ 0x00E0 ; 224 (V28 mode)

; Hardware version address
hardware_ver_address	equ 0x00A10001

; TMSS
tmss_address			equ 0x00A14000
tmss_signature			equ 'SEGA'
	