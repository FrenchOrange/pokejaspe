	db  90,  30,  15,  15,  40,  20 ; 210 BST
	;   hp  atk  def  spe  sat  sdf

	db NORMAL, FAIRY ; type
	db 150 ; catch rate
	db 39 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F75, HATCH_FASTER ; gender ratio, step cycles to hatch

	abilities_for IGGLYBUFF, CUTE_CHARM, COMPETITIVE, FRISK
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 1 HP

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, SOLAR_BEAM, RETURN, DIG, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, REFLECT, FLAMETHROWER, FIRE_BLAST, SUBSTITUTE, FACADE, REST, ATTRACT, WILD_CHARGE, WATER_PULSE, FLASH, THUNDER_WAVE, BODY_SLAM, CHARM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, DREAM_EATER, ENDURE, HEADBUTT, HYPER_VOICE, ICY_WIND, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, ZAP_CANNON
	; end
