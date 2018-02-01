BlackthornPokeCenter1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 5, 7, 5, BLACKTHORN_CITY
	warp_event 6, 7, 5, BLACKTHORN_CITY
	warp_event 0, 7, 1, POKECENTER_2F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10, 1, SIGNPOST_READ, PokemonJournalClairScript

	db 5 ; object events
	pc_nurse_event 5, 1
	object_event 8, 1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ProfOaksAide4Script, -1
	object_event 11, 6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumpstd, happinesschecknpc, -1
	object_event 8, 4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, BlackthornPokeCenter1FGentlemanText, -1
	object_event 1, 4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, BlackthornPokeCenter1FTwinText, -1

PokemonJournalClairScript:
	setflag ENGINE_READ_CLAIR_JOURNAL
	thistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Clair!"

	para "Clair's bright blue"
	line "outfit and cape"

	para "have made her the"
	line "latest name in"
	cont "fashion."
	done

ProfOaksAide4Script:
	checkevent EVENT_GOT_LUCKY_EGG_FROM_PROF_OAKS_AIDE
	iftrue_jumptextfaceplayer .ExplainText
	faceplayer
	opentext
	writetext .HiText
	waitbutton
	count_seen_caught
	checkcode VAR_DEXCAUGHT
	if_greater_than 59, .HereYouGo
	thisopenedtext

	text "Let's see…"
	line "Uh-oh! You've only"

	para "caught @"
	deciram wd003, 1, 3
	text " kinds"
	line "of #mon."

	para "Come back and see"
	line "me when you catch"
	cont "60 kinds."
	done

.HereYouGo
	writetext .HereYouGoText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse_jumpopenedtext .NoRoomText
	setevent EVENT_GOT_LUCKY_EGG_FROM_PROF_OAKS_AIDE
	thisopenedtext

.ExplainText:
	text "That Lucky Egg"
	line "helps a #mon"

	para "gain more exper-"
	line "ience than usual."

	para "Use it to com-"
	line "plete the #dex!"
	done

.HiText:
	text "Hello there! I'm"
	line "Prof.Oak's aide."

	para "If you caught 60"
	line "kinds of #mon,"

	para "I'm supposed to"
	line "give you an item."

	para "So, <PLAYER>,"
	line "have you caught"

	para "at least 60 kinds"
	line "of #mon?"
	done

.HereYouGoText:
	text "Let's see…"
	line "Great job! You've"

	para "caught @"
	deciram wd003, 1, 3
	text " kinds"
	line "of #mon."

	para "Congratulations!"
	line "Here you go!"
	done

.NoRoomText:
	text "Oh! I see you"
	line "don't have any"
	cont "room for this."
	done

BlackthornPokeCenter1FGentlemanText:
	text "Deep inside far-"
	line "off Indigo Plateau"

	para "is the #mon"
	line "League."

	para "I hear the best"
	line "trainers gather"

	para "there from around"
	line "the country."
	done

BlackthornPokeCenter1FTwinText:
	text "There was this"
	line "move I just had"

	para "to teach my #-"
	line "mon."

	para "So I got the Move"
	line "Deleter to make it"
	cont "forget an HM move."
	done
