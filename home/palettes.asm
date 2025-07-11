; Functions dealing with palettes.

UpdateCGBPalsLYTimed:
; checks if there is time to run UpdateCGBPals.
	ldh a, [rLY]
	cp 150
	ret nc
	; fallthrough
UpdateCGBPals::
; any pals to update?
	ldh a, [hCGBPalUpdate]
	and a
	ret z
	; fallthrough
ForceUpdateCGBPals::
; update bgp data from wBGPals2
; update obp data from wOBPals2
; return carry if successful
; Completes in 588 cycles

	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a

	ld hl, wBGPals2

; copy 8 pals to bgpd
	ld a, BGPI_AUTOINC
	ldh [rBGPI], a
	lb bc, 4, LOW(rBGPD) ; 4 = NUM_PALS / 2
.bgp
rept 2 palettes
	ld a, [hli]
	ldh [c], a
endr

	dec b
	jr nz, .bgp

; hl is now 5:d0c0 wOBPals2

; copy 8 pals to obpd
	ld a, %10000000 ; auto increment, index 0
	ldh [rOBPI], a
	lb bc, 4, LOW(rOBPD) ; 4 = NUM_PALS / 2
.obp
rept 2 palettes
	ld a, [hli]
	ldh [c], a
endr

	dec b
	jr nz, .obp

	pop af
	ldh [rWBK], a

; clear pal update queue
	xor a
	ldh [hCGBPalUpdate], a

	scf
	ret

DmgToCgbBGPals::
; exists to forego reinserting cgb-converted image data

; input: a -> bgp

	ldh [rBGP], a

	push hl
	push de
	push bc
	push af

	ldh a, [rWBK]
	push af

	ld a, 5 ; gfx
	ldh [rWBK], a

; copy & reorder bg pal buffer
	ld hl, wBGPals2 ; to
	ld de, wBGPals1 ; from
; order
	ldh a, [rBGP]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, 1
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rWBK], a

	jmp PopAFBCDEHL

DmgToCgbObjPals::
; exists to forego reinserting cgb-converted image data

; input: d -> obp1
;        e -> obp2

	ld a, e
	ldh [rOBP0], a
	ld a, d
	ldh [rOBP1], a

	push hl
	push de
	push bc
	ldh a, [rWBK]
	push af

	ld a, BANK(wOBPals1)
	ldh [rWBK], a

; copy & reorder obj pal buffer
	ld hl, wOBPals2 ; to
	ld de, wOBPals1 ; from
; order
	ldh a, [rOBP0]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, 1
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rWBK], a
	jmp PopBCDEHL

DmgToCgbObjPal0::
	ldh [rOBP0], a
	push hl
	push de
	push bc
	push af

	ldh a, [rWBK]
	push af
	ld a, 5 ; gfx
	ldh [rWBK], a

	ld hl, wOBPals2
	ld de, wOBPals1
	ldh a, [rOBP0]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, 1
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rWBK], a

	jmp PopAFBCDEHL

DmgToCgbObjPal1::
	ldh [rOBP1], a
	push hl
	push de
	push bc
	push af

	ldh a, [rWBK]
	push af
	ld a, 5 ; gfx
	ldh [rWBK], a

	ld hl, wOBPals2 palette 1
	ld de, wOBPals1 palette 1
	ldh a, [rOBP1]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, 1
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rWBK], a

	jmp PopAFBCDEHL

CopyPals::
; copy c palettes in order b from de to hl

	push bc
	ld c, 4 ; PAL_COLORS
.loop
	push de
	push hl

; get pal color
	ld a, b
	and %11 ; color
; 2 bytes per color
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]

; dest
	pop hl
; write color
	ld [hli], a
	ld a, d
	ld [hli], a
; next pal color
	srl b
	srl b
; source
	pop de
; done pal?
	dec c
	jr nz, .loop

; de += 8 (next pal)
	ld a, 1 palettes ; PAL_COLORS * 2 ; bytes per pal
	add e
	ld e, a
	adc d
	sub e
	ld d, a

; how many more pals?
	pop bc
	dec c
	jr nz, CopyPals
	ret

ClearVBank1::
	ld a, 1
	ldh [rVBK], a

	ld hl, vTiles0
	ld bc, STARTOF(VRAM) + SIZEOF(VRAM) - vTiles0
	xor a
	rst ByteFill

	xor a
	ldh [rVBK], a
	ret

Special_ReloadSpritesNoPalettes::
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a
	ld hl, wBGPals2
	ld bc, 8 palettes
	xor a
	rst ByteFill
	pop af
	ldh [rWBK], a
	ld a, 1
	ldh [hCGBPalUpdate], a
	jmp DelayFrame

SetBlackObjectPals::
	ldh a, [rWBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rWBK], a
	ld hl, wOBPals2
	ld bc, 8 palettes
	xor a
	rst ByteFill
	pop af
	ldh [rWBK], a
	ld a, 1
	ldh [hCGBPalUpdate], a
	jmp DelayFrame
