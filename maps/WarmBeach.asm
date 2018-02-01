WarmBeach_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 15, 13, 1, WARM_BEACH_SHACK
	warp_event 8, 5, 2, SHAMOUTI_TUNNEL
	warp_event 3, 8, 1, WARM_BEACH_HOUSE

	db 0 ; coord events

	db 4 ; bg events
	bg_event 17, 14, SIGNPOST_JUMPTEXT, WarmBeachShackSignText
	bg_event 18, 20, SIGNPOST_JUMPTEXT, WarmBeachShrineText
	bg_event 19, 20, SIGNPOST_JUMPTEXT, WarmBeachShrineText
	bg_event 6, 20, SIGNPOST_ITEM + PEARL, EVENT_WARM_BEACH_HIDDEN_PEARL

	db 7 ; object events
	object_event 11, 8, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSightseermGareth, -1
	object_event 4, 12, SPRITE_LADY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerAromaLadyHolly, -1
	object_event 11, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, WarmBeachCooltrainermText, -1
	object_event 22, 20, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, jumptextfaceplayer, WarmBeachCooltrainerfText, -1
	object_event 17, 21, SPRITE_SLOWKING, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, WarmBeachSlowkingScript, -1
	object_event 11, 20, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WarmBeachLassScript, -1
	object_event 6, 23, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, WarmBeachLadyText, -1

TrainerSightseermGareth:
	trainer SIGHTSEERM, GARETH, EVENT_BEAT_SIGHTSEERM_GARETH, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "I just picked up"
	line "some useful items"

	para "from the outdoor"
	line "market!"
	done

.BeatenText:
	text "My items weren't"
	line "enough…"
	done

.AfterText:
	text "Even outside of"
	line "battle, these"

	para "items make memor-"
	line "able souvenirs."
	done

TrainerAromaLadyHolly:
	trainer AROMA_LADY, HOLLY, EVENT_BEAT_AROMA_LADY_HOLLY, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "I am at one with"
	line "the aromas of"
	cont "nature."
	done

.BeatenText:
	text "Defeat has its"
	line "own scent…"
	done

.AfterText:
	text "The sense of smell"
	line "is vital to living"
	cont "in nature."
	done

WarmBeachCooltrainermText:
	text "There's a #mon"
	line "here that talks!"

	para "I would never be-"
	line "lieve it if I"

	para "hadn't seen it for"
	line "myself!"
	done

WarmBeachCooltrainerfText:
	text "I've been selected"
	line "as the festival"
	cont "maiden this year,"

	para "so I have to play"
	line "the melody of the"
	cont "Chosen One."

	para "I'm pretty nervous,"
	line "so I came here to"
	cont "practice."
	done

WarmBeachSlowkingScript:
	thistext

	text "I could use"
	line "pants…"
	done

WarmBeachLassScript:
	faceplayer
	opentext
	checkflag ENGINE_SEASHORE_SHELL_BELL
	iftrue .BoughtShellBell
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse .NoBuy
	checkmoney $0, 4000
	if_equal $2, .NotEnoughMoney
	giveitem SHELL_BELL
	iffalse .NoRoom
	setflag ENGINE_SEASHORE_SHELL_BELL
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 4000
	special PlaceMoneyTopRight
	jumpopenedtext .Text2

.BoughtShellBell:
	jumpopenedtext .Text3

.NoBuy:
	jumpopenedtext .Text4

.NotEnoughMoney:
	jumpopenedtext .Text5

.NoRoom:
	jumpopenedtext .Text6

.Text1:
	text "I collect shells"
	line "off the beach and"

	para "turn them into"
	line "Shell Bells."

	para "People say their"
	line "chime is healing."

	para "They're ¥4000"
	line "each. Want one?"
	done

.Text2:
	text "One Shell Bell,"
	line "just for you!"
	done

.Text3:
	text "I only made one"
	line "Shell Bell today…"
	done

.Text4:
	text "That's OK!"
	done

.Text5:
	text "You don't have"
	line "enough money…"
	done

.Text6:
	text "You don't have"
	line "enough room…"
	done

WarmBeachLadyText:
	text "Those islands"
	line "across the water"

	para "are known as the"
	line "temples of Fire,"

	para "Ice, and Light-"
	line "ning."

	para "That's what this"
	line "brochure says,"

	para "but what are they"
	line "for?"
	done

WarmBeachShackSignText:
	text "Beach Shack"
	done

WarmBeachShrineText:
	text "It's a shrine"
	line "dedicated to the"

	para "Guardian of the"
	line "Seas."
	done
