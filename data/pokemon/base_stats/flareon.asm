	db  65, 130,  60,  65,  95, 110 ; 525 BST
	;   hp  atk  def  spe  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F12_5, HATCH_SLOWER ; gender ratio, step cycles to hatch

	abilities_for FLAREON, FLASH_FIRE, FLASH_FIRE, GUTS
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm CURSE, CALM_MIND, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, SWIFT, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, ATTRACT, WILL_O_WISP, GIGA_IMPACT, STRENGTH, BATON_PASS, BODY_SLAM, CHARM, DOUBLE_EDGE, ENDURE, HEADBUTT, HYPER_VOICE, PAY_DAY, SLEEP_TALK, SWAGGER, ZAP_CANNON
	; end
