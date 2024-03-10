
ProjectCredits:
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	call ClearBGPalettes

	ld a, CGB_PLAIN
	call GetCGBLayout
	call SetPalettes
	xor a ; FALSE

	ld hl, .MenuDataHeader
	call LoadMenuHeader
	call ProjectCreditsJoypadLoop
	call CloseWindow
	ret c

	ld a, "<BLACK>"
	call FillTileMap
	ld [wJumptableIndex], a
	ld hl, .Jumptable
	call JumpTable

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 16, 7
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 0 ; items
	dw ProjectCreditsMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
	db "Project@"
	db "Engine@"
	db "Resources@"

.Jumptable:
	dw CreditsMenu_Project
	dw CreditsMenu_Engine
	dw CreditsMenu_Resources

	const_def
	const CREDITSMENU_ITEM_PROJECT   ; 0
	const CREDITSMENU_ITEM_ENGINE    ; 1
	const CREDITSMENU_ITEM_RESOURCES ; 2

ProjectCreditsMenuItems:
	db 3
	db CREDITSMENU_ITEM_PROJECT
	db CREDITSMENU_ITEM_ENGINE
	db CREDITSMENU_ITEM_RESOURCES
	db -1

ProjectCreditsJoypadLoop:
	call SetUpMenu
.loop
	ld [w2DMenuFlags1], a
	call ReadMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr nz, .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	ret

CreditsMenu_Project:
	call ClearBGPalettes
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 2, 2
	ld de, TestOptions1
	rst PlaceString

TestOptions1:
	text  "WIP1"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	done

CreditsMenu_Engine:
	call ClearBGPalettes
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 2, 2
	ld de, TestOptions2
	rst PlaceString

TestOptions2:
	text  "WIP2"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "Done"
	done

CreditsMenu_Resources:
	call ClearBGPalettes
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 2, 2
	ld de, TestOptions3
	rst PlaceString

TestOptions3:
	text  "WIP3"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	next1 "WIP"
	done
