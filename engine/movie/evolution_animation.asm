EvolutionAnimation:
	push hl
	push de
	push bc
	ld a, [wCurSpecies]
	push af
	ld a, [wCurForm]
	push af
	ldh a, [rOBP0]
	push af
	call .EvolutionAnimation
	pop af
	ldh [rOBP0], a
	pop af
	ld [wCurForm], a
	pop af
	ld [wCurSpecies], a
	pop bc
	pop de
	pop hl

	ld a, [wEvolutionCanceled]
	and a
	ret z

	scf
	ret

.EvolutionAnimation:
	ld a, %11100100
	ldh [rOBP0], a

	ld e, MUSIC_NONE
	call PlayMusic

	call ClearSpriteAnims

	ld de, .GFX
	ld hl, vTiles0
	lb bc, BANK(.GFX), 8
	call Request2bpp

	xor a
	ld [wLowHealthAlarm], a
	call ApplyTilemapInVBlank
	xor a
	ldh [hBGMapMode], a
	ld a, [wEvolutionOldSpecies]
	ld [wPlayerHPPal], a

	call .GetColoredCGBLayout
	ld a, [wEvolutionOldSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData ; [wCurForm] is already set
	hlcoord 7, 2
	call PrepMonFrontpic

	ld de, vTiles2
	ld hl, vTiles2 tile $31
	ld bc, 7 * 7
	call Request2bpp

	ld a, $1
	ldh [hBGMapMode], a
	call .check_statused
	jr c, .skip_cry

	ld hl, wEvolutionOldSpecies
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call PlayMonCry

.skip_cry
	ld e, MUSIC_EVOLUTION
	call PlayMusic

	ld a, 7 * 7
	ld [wEvolutionPicOffset], a
	call .ReplaceFrontpic
	ld hl, wEvolutionNewSpecies
	ld a, [hli]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld a, [hl]
	ld [wCurForm], a

	call .LoadFrontpic
	ld c, 80
	call DelayFrames

	ld c, TRUE
	call .GetCGBLayout
	call .AnimationSequence
	jmp c, .cancel_evo

	ld a, -7 * 7
	ld [wEvolutionPicOffset], a
	call .ReplaceFrontpic
	xor a
	ld [wEvolutionCanceled], a

	ld a, [wEvolutionNewForm]
	ld [wTempMonForm], a

	ld a, [wEvolutionNewSpecies]
	ld [wPlayerHPPal], a
	ld [wTempMonSpecies], a

	call .GetColoredCGBLayout
	ld de, SFX_EVOLVED
	call PlaySFX
	ld hl, wJumptableIndex
	ld a, [hl]
	push af
	ld [hl], $0
.loop4
	ld hl, wJumptableIndex
	ld a, [hl]
	cp 32
	jr nc, .done
	ld d, a
	inc [hl]
	and $1
	jr nz, .done_balls
	ld e, a
	call .GenerateBallOfLight
	ld e, $10
	call .GenerateBallOfLight
.done_balls
	call .AnimateBallsOfLight
	jr .loop4

.done
	ld c, 32
.loop5
	call .AnimateBallsOfLight
	dec c
	jr nz, .loop5
	pop af
	ld [wJumptableIndex], a
	call ClearSpriteAnims
	call .check_statused
	ret c

	ld a, [wBoxAlignment]
	push af
	ld a, $1
	ld [wBoxAlignment], a
	ld a, [wCurPartySpecies]
	push af
	ld a, [wCurForm]
	push af

	ld a, [wPlayerHPPal]
	ld [wCurPartySpecies], a
	hlcoord 7, 2
	lb de, $0, ANIM_MON_EVOLVE
	predef AnimateFrontpic

	pop af
	ld [wCurForm], a
	pop af
	ld [wCurPartySpecies], a
	pop af
	ld [wBoxAlignment], a
	ret

.cancel_evo
	ld a, TRUE
	ld [wEvolutionCanceled], a

	ld a, [wEvolutionOldSpecies]
	ld [wPlayerHPPal], a

	ld e, MUSIC_NONE
	call PlayMusic

	call .GetColoredCGBLayout
	call ClearSpriteAnims
	call .check_statused
	ret c

	ld hl, wEvolutionOldSpecies
	ld a, [hli]
	ld c, a
	ld b, [hl]
	jmp PlayMonCry

.GetColoredCGBLayout:
	ld c, FALSE
.GetCGBLayout:
	ld a, CGB_EVOLUTION
	jmp GetCGBLayout

.LoadFrontpic:
	call GetBaseData ; [wCurForm] is already set
	ld a, $1
	ld [wBoxAlignment], a
	ld de, vTiles2
	predef FrontpicPredef
	xor a
	ld [wBoxAlignment], a
	ret

.AnimationSequence:
	call ClearJoypad
	lb bc, 1, 2 * 7 ; flash b times, wait c frames in between
.loop
	push bc
	call .WaitFrames_CheckPressedB
	pop bc
	jr c, .exit_sequence
	push bc
	call .Flash
	pop bc
	inc b
	dec c
	dec c
	jr nz, .loop
	and a
	ret

.exit_sequence
	scf
	ret

.Flash:
	ld a, -7 * 7 ; new stage
	ld [wEvolutionPicOffset], a
	call .ReplaceFrontpic
	ld a, 7 * 7 ; previous stage
	ld [wEvolutionPicOffset], a
	call .ReplaceFrontpic
	dec b
	jr nz, .Flash
	ret

.ReplaceFrontpic:
	push bc
	xor a
	ldh [hBGMapMode], a
	hlcoord 7, 2
	lb bc, 7, 7
	ld de, SCREEN_WIDTH - 7
.loop1
	push bc
.loop2
	ld a, [wEvolutionPicOffset]
	add [hl]
	ld [hli], a
	dec c
	jr nz, .loop2
	pop bc
	add hl, de
	dec b
	jr nz, .loop1
	ld a, $1
	ldh [hBGMapMode], a
	call ApplyTilemapInVBlank
	pop bc
	ret

.WaitFrames_CheckPressedB:
	call DelayFrame
	push bc
	call JoyTextDelay
	ldh a, [hJoyDown]
	pop bc
	and PAD_B
	jr nz, .pressed_b
.loop3
	dec c
	jr nz, .WaitFrames_CheckPressedB
	and a
	ret

.pressed_b
	ld a, [wForceEvolution]
	and a
	jr nz, .loop3
	scf
	ret

.check_statused
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	jmp CheckFaintedFrzSlp

.GenerateBallOfLight:
	push de
	depixel 9, 11
	ld a, SPRITE_ANIM_INDEX_EVOLUTION_BALL_OF_LIGHT
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [wJumptableIndex]
	and %1110
	add a
	pop de
	add e
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $10
	ret

.AnimateBallsOfLight:
	push bc
	farcall PlaySpriteAnimations
	; a = (([hVBlankCounter] + 4) / 2) % NUM_PALETTES
	ldh a, [hVBlankCounter]
	and %1110
	srl a
	inc a
	inc a
	and $7
	ld b, a
	ld hl, wShadowOAM + 3 ; attributes
	ld c, 40
.loop6
	ld a, [hl]
	or b
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop6
	pop bc
	jmp DelayFrame

.GFX:
INCBIN "gfx/evo/bubble_large.2bpp"
INCBIN "gfx/evo/bubble.2bpp"
