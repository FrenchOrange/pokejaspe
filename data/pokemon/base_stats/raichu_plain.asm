	db  60,  90,  55, 110,  90,  80 ; 485 BST
	;   hp  atk  def  spe  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp
	db ORAN_BERRY, LIGHT_BALL ; held items
	dn GENDER_F50, HATCH_FASTER ; gender ratio, step cycles to hatch

	abilities_for RAICHU, STATIC, STATIC, LIGHTNING_ROD
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	ev_yield 3 Spe

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, FOCUS_BLAST, WILD_CHARGE, GIGA_IMPACT, FLASH, VOLT_SWITCH, THUNDER_WAVE, STRENGTH, AGILITY, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, HEADBUTT, KNOCK_OFF, PAY_DAY, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON
	; end
