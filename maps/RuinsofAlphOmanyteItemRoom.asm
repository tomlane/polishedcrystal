RuinsofAlphOmanyteItemRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event 3, 9, 5, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_event 4, 9, 5, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_event 3, 1, 1, RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	warp_event 4, 1, 2, RUINS_OF_ALPH_OMANYTE_WORD_ROOM

	db 0 ; coord events

	db 2 ; bg events
	bg_event 2, 1, SIGNPOST_JUMPTEXT, UnknownText_0x59a37
	bg_event 5, 1, SIGNPOST_JUMPTEXT, UnknownText_0x59a37

	db 4 ; object events
	itemball_event 2, 6, PEARL_STRING, 1, EVENT_PICKED_UP_PEARL_STRING_FROM_OMANYTE_ITEM_ROOM
	itemball_event 5, 6, BIG_PEARL, 1, EVENT_PICKED_UP_BIG_PEARL_FROM_OMANYTE_ITEM_ROOM
	itemball_event 2, 4, STARDUST, 1, EVENT_PICKED_UP_STARDUST_FROM_OMANYTE_ITEM_ROOM
	itemball_event 5, 4, STAR_PIECE, 1, EVENT_PICKED_UP_STAR_PIECE_FROM_OMANYTE_ITEM_ROOM

UnknownText_0x59a37:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done
