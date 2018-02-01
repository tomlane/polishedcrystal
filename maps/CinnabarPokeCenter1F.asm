CinnabarPokeCenter1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 5, 7, 1, CINNABAR_ISLAND
	warp_event 6, 7, 1, CINNABAR_ISLAND
	warp_event 0, 7, 1, POKECENTER_2F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10, 1, SIGNPOST_READ, PokemonJournalBlaineScript

	db 3 ; object events
	pc_nurse_event 5, 1
	object_event 2, 5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, CinnabarPokeCenter1FCooltrainerfText, -1
	object_event 9, 4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, CinnabarPokeCenter1FFisherText, -1

PokemonJournalBlaineScript:
	setflag ENGINE_READ_BLAINE_JOURNAL
	thistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Blaine!"

	para "Blaine is said to"
	line "only remove his"

	para "shades when he is"
	line "thinking up new"
	cont "riddles."
	done

CinnabarPokeCenter1FCooltrainerfText:
	text "Cinnabar Gym's"
	line "Blaine apparently"

	para "lives alone in the"
	line "Seafoam Islands"
	cont "cave…"
	done

CinnabarPokeCenter1FFisherText:
	text "It's been a year"
	line "since the volcano"
	cont "erupted."
	done
