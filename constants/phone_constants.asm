; PhoneContacts indexes (see data/phone/phone_contacts.asm)
	const_def
	const PHONE_00
	const PHONE_MOM
	const PHONE_OAK
	const PHONE_BILL
	const PHONE_ELM
	const PHONE_LYRA
	const PHONE_SCHOOLBOY_JACK
	const PHONE_POKEFAN_BEVERLY
	const PHONE_SAILOR_HUEY
	const_skip
	const_skip
	const PHONE_COOLTRAINERM_GAVEN
	const PHONE_COOLTRAINERF_BETH
	const PHONE_BIRDKEEPER_JOSE
	const PHONE_COOLTRAINERF_REENA
	const PHONE_YOUNGSTER_JOEY
	const PHONE_BUG_CATCHER_WADE
	const PHONE_FISHER_RALPH
	const PHONE_PICNICKER_LIZ
	const PHONE_HIKER_ANTHONY
	const PHONE_CAMPER_TODD
	const PHONE_PICNICKER_GINA
	const PHONE_JUGGLER_IRWIN
	const PHONE_BUG_CATCHER_ARNIE
	const PHONE_SCHOOLBOY_ALAN
	const_skip
	const PHONE_LASS_DANA
	const PHONE_SCHOOLBOY_CHAD
	const PHONE_POKEFANM_DEREK
	const PHONE_FISHER_TULLY
	const PHONE_POKEMANIAC_BRENT
	const PHONE_PICNICKER_TIFFANY
	const PHONE_BIRDKEEPER_VANCE
	const PHONE_FISHER_WILTON
	const PHONE_BLACKBELT_KENJI
	const PHONE_HIKER_PARRY
	const PHONE_PICNICKER_ERIN
	const PHONE_BUENA
DEF NUM_PHONE_CONTACTS EQU const_value - 1

; SpecialPhoneCallList indexes (see data/phone/special_calls.asm)
	const_def
	const SPECIALCALL_NONE
	const SPECIALCALL_POKERUS
	const SPECIALCALL_ROBBED
	const SPECIALCALL_ASSISTANT
	const SPECIALCALL_WEIRDBROADCAST
	const SPECIALCALL_SSTICKET
	const SPECIALCALL_BIKESHOP
	const SPECIALCALL_WORRIED
	const SPECIALCALL_MASTERBALL
	const SPECIALCALL_YELLOWFOREST
	const SPECIALCALL_FIRSTBADGE
	const SPECIALCALL_SECONDBADGE
	const SPECIALCALL_LYRASEGG
DEF NUM_SPECIALCALLS EQU const_value - 1
DEF SPECIALCALL_SIZE EQU 6

; phone struct members
rsreset
DEF PHONE_CONTACT_TRAINER_CLASS  rb
DEF PHONE_CONTACT_TRAINER_NUMBER rb
DEF PHONE_CONTACT_MAP_GROUP      rb
DEF PHONE_CONTACT_MAP_NUMBER     rb
DEF PHONE_CONTACT_SCRIPT1_TIME   rb
DEF PHONE_CONTACT_SCRIPT1_BANK   rb
DEF PHONE_CONTACT_SCRIPT1_ADDR   rw
DEF PHONE_CONTACT_SCRIPT2_TIME   rb
DEF PHONE_CONTACT_SCRIPT2_BANK   rb
DEF PHONE_CONTACT_SCRIPT2_ADDR   rw
DEF PHONE_CONTACT_SIZE EQU _RS

; maximum number of pokegear contacts
DEF CONTACT_LIST_SIZE EQU 30