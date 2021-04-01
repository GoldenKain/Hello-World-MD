;==============================================================
;   http://www.bigevilcorporation.co.uk
;==============================================================
;   SEGA Genesis Framework (c) Matt Phillips 2014
;==============================================================
;   interpts.asm - Interrupts and exceptions
;==============================================================

INT_VBlank:
	rte

INT_HBlank:
	rte

INT_Null:
	rte

CPU_Exception:
	stop   #0x2700
	rte
