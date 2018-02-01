SaffronOrreSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 2, 7, 17, SAFFRON_CITY
	warp_event 3, 7, 17, SAFFRON_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 2, 4, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, jumptextfaceplayer, SaffronOrreSpeechHouseSilphEmployeeText, -1
	object_event 5, 4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, SaffronOrreSpeechHouseCooltrainerMText, -1

SaffronOrreSpeechHouseSilphEmployeeText:
	text "I heard about a"
	line "method to seal off"
	cont "a #mon's heart"

	para "and force them to"
	line "attack people."

	para "How could anyone"
	line "do such a horrible"
	cont "thing to #mon?!"
	done

SaffronOrreSpeechHouseCooltrainerMText:
	text "We just got back"
	line "from seeing a"

	para "friend in another"
	line "region."

	para "They had a lot of"
	line "trouble from two"
	cont "criminal gangs,"

	para "but a talented"
	line "trainer stepped up"
	cont "to save them."
	done
