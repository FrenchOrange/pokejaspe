BattleCommand_metronome:
	call ClearLastMove
	call CheckUserIsCharging
	jr nz, .charging

	ld a, [wBattleAnimParam]
	push af
	call BattleCommand_lowersub
	pop af
	ld [wBattleAnimParam], a

.charging
	call LoadMoveAnim

.GetMove:
	call BattleRandom

; None of the moves in MetronomeExcepts.
	push af
	ld hl, MetronomeExcepts
	call IsInByteArray
	pop bc
	jr c, .GetMove

; No moves the user already has.
	ld a, b
	call CheckUserMove
	jr z, .GetMove

if DEF(DEBUG)
	ld b, WILL_O_WISP
endc
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld [hl], b
	call UpdateMoveData
	jmp ResetTurn

INCLUDE "data/moves/metronome_exception_moves.asm"