Route36RuinsofAlphGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event 4, 0, 3, ROUTE_36
	warp_event 5, 0, 4, ROUTE_36
	warp_event 4, 7, 9, RUINS_OF_ALPH_OUTSIDE
	warp_event 5, 7, 9, RUINS_OF_ALPH_OUTSIDE

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 0, 4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x6aa20, -1
	object_event 7, 5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x6aa5b, -1

UnknownText_0x6aa20:
	text "Don't you wonder"
	line "who'd make some-"
	cont "thing like this?"
	cont "And why?"
	done

UnknownText_0x6aa5b:
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "Ruins of Alph."
	done
