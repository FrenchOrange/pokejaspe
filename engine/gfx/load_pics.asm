GetFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	and a
	ret z
	ldh a, [rSVBK]
	push af
	call _GetFrontpic
	pop af
	ldh [rSVBK], a
	ret

PrepareFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	and a
	ret z
	ldh a, [rSVBK]
	push af
	call _PrepareFrontpic
	pop af
	ldh [rSVBK], a
	ret

FrontpicPredef:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	and a
	ret z
	ldh a, [rSVBK]
	push af
	xor a
	ldh [hBGMapMode], a
	call _GetFrontpic
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	xor a
	ldh [rVBK], a
	pop af
	ldh [rSVBK], a
	ret

_GetFrontpic:
	call _PrepareFrontpic
	call GetPaddedFrontpicAddress
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	push hl
	call Get2bpp
	pop hl
	ret

_PrepareFrontpic:
	push de

	; This is no longer needed for the pic size, but do it just
	; in case subsequent code expects base data available
	call GetBaseData ; [wCurSpecies] and [wCurForm] are already set

	call GetPicSize
	ld b, a
	ld [wMonPicSize], a

	push bc
	; Get frontpic pointer
	ld a, [wCurPartySpecies]
	ld c, a
	ld a, [wCurForm]
	ld b, a
	call GetCosmeticSpeciesAndFormIndex
	ld hl, PokemonPicPointers
rept 5
	add hl, bc
endr
	ld a, BANK(PokemonPicPointers)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(PokemonPicPointers)
	call GetFarWord
	pop bc

	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	call FarDecompressInB
	; Save decompressed size
	swap e
	swap d
	ld a, d
	and $f0
	or e
	ld [wMonAnimationSize], a

	pop bc
	call PadFrontpic
	pop hl
	ret

GetBackpic:
	ld a, [wCurPartySpecies]
	and a
	ret z
	; c = species
	ld a, [wCurPartySpecies]
	ld c, a
	; b = form
	ld a, [wCurForm]
	ld b, a
	ldh a, [rSVBK]
	push af
	ld a, $6
	ldh [rSVBK], a
	push de
	; bc = index
	call GetCosmeticSpeciesAndFormIndex
	ld hl, PokemonPicPointers
rept 5
	add hl, bc
endr
	ld a, BANK(PokemonPicPointers)
	call GetFarByte
	push af
	inc hl
	inc hl
	inc hl
	ld a, BANK(PokemonPicPointers)
	call GetFarWord
	pop af
	call FarDecompress
	ld hl, wDecompressScratch
	call FixBackpicAlignment
	pop hl
	ld de, wDecompressScratch
	ldh a, [hROMBank]
	ld b, a
	ld c, 6 * 6
	call Get2bpp
	pop af
	ldh [rSVBK], a
	ret

GetTrainerPic:
	ld a, [wTrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASS_PICS + 1
	ret nc
	call ApplyTilemapInVBlank
	xor a
	ldh [hBGMapMode], a
	ld hl, TrainerPicPointers
	ld a, [wTrainerClass]
	dec a
	ld bc, 3
	rst AddNTimes
	ldh a, [rSVBK]
	push af
	ld a, $6
	ldh [rSVBK], a
	push de
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarWord
	pop af
_Decompress7x7Pic:
	call FarDecompress
	pop hl
	ld de, wDecompressScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ldh [rSVBK], a
	call ApplyTilemapInVBlank
	ld a, $1
	ldh [hBGMapMode], a
	ret

GetPaintingPic:
	ld a, [wTrainerClass]
	call ApplyTilemapInVBlank
	xor a
	ldh [hBGMapMode], a
	ld hl, PaintingPicPointers
	ld a, [wTrainerClass]
	ld bc, 2
	rst AddNTimes
	ldh a, [rSVBK]
	push af
	ld a, $6
	ldh [rSVBK], a
	push de
	ld a, BANK(PaintingPicPointers)
	call GetFarWord
	ld a, BANK("Painting Pics")
	jr _Decompress7x7Pic

FixBackpicAlignment:
	ld a, [wBoxAlignment]
	and a
	ret z

	ld de, 6 * 6 tiles
.loop
	ld a, [hl]

; https://github.com/pret/pokecrystal/wiki/Optimizing-assembly-code#reverse-the-bits-of-a
	ld b, a
	rlca
	rlca
	xor b
	and $aa
	xor b
	ld b, a
	swap b
	xor b
	and $33
	xor b
	rrca

	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .loop
	ret

PadFrontpic:
	call GetPaddedFrontpicAddress
	ld h, d
	ld l, e
	ld de, wDecompressScratch

	ld a, b
	sub 5
	jr z, .five
	dec a
	jr z, .six

.seven_loop
	ld c, 7 tiles
	call LoadAlignedFrontpic
	dec b
	jr nz, .seven_loop
	ret

.six
	ld c, 7 tiles
	call .Fill
.six_loop
	ld c, 1 tiles
	call .Fill
	ld c, 6 tiles
	call LoadAlignedFrontpic
	dec b
	jr nz, .six_loop
	ret

.five
	ld c, 7 tiles
	call .Fill
.five_loop
	ld c, 2 tiles
	call .Fill
	ld c, 5 tiles
	call LoadAlignedFrontpic
	dec b
	jr nz, .five_loop
	ld c, 7 tiles
	; fallthrough

.Fill:
	xor a
.fill_loop
	ld [hli], a
	dec c
	jr nz, .fill_loop
	ret

LoadAlignedFrontpic:
	ld a, [wBoxAlignment]
	and a
	jr nz, .x_flip
.left_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .left_loop
	ret

.x_flip
	push bc
.right_loop
	ld a, [de]
	inc de

; https://github.com/pret/pokecrystal/wiki/Optimizing-assembly-code#reverse-the-bits-of-a
	ld b, a
	rlca
	rlca
	xor b
	and $aa
	xor b
	ld b, a
	swap b
	xor b
	and $33
	xor b
	rrca

	ld [hli], a
	dec c
	jr nz, .right_loop
	pop bc
	ret
