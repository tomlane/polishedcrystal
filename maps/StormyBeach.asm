StormyBeach_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 30, 4, 1, MURKY_SWAMP
	warp_event 31, 4, 2, MURKY_SWAMP

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17, 6, SIGNPOST_ITEM + STARDUST, EVENT_STORMY_BEACH_HIDDEN_STARDUST

	db 11 ; object events
	object_event 5, 13, SPRITE_GOLDENROD_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerSwimmerfBarbara, -1
	object_event 14, 8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperJulian, -1
	object_event 28, 7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerCamperFelix, -1
	object_event 24, 11, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerPicnickerLily, -1
	object_event 26, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SWIM_AROUND, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, StormyBeachSwimmermText, -1
	object_event 32, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_COMMAND, jumptextfaceplayer, StormyBeachGrampsText, -1
	itemball_event 34, 7, ZINC, 1, EVENT_STORMY_BEACH_ZINC
	smashrock_event 16, 6
	smashrock_event 17, 7
	smashrock_event 12, 9
	smashrock_event 18, 10

TrainerSwimmerfBarbara:
	trainer SWIMMERF, BARBARA, EVENT_BEAT_SWIMMERF_BARBARA, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "I was resting for"
	line "a while, but I am"

	para "always ready to"
	line "fight!"
	done

.BeatenText:
	text "It was a good"
	line "battle, even if"
	cont "I lost."
	done

.AfterText:
	text "I'm being dragged"
	line "by the tides…"
	done

TrainerBird_keeperJulian:
	trainer BIRD_KEEPER, JULIAN, EVENT_BEAT_BIRD_KEEPER_JULIAN, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "I'm training my"
	line "Flying-type #-"
	cont "mon here."

	para "Want to help me?"
	done

.BeatenText:
	text "I lost…"
	line "What a pity!"
	done

.AfterText:
	text "It's harder to fly"
	line "in stormy places"
	cont "like this."
	done

TrainerCamperFelix:
	trainer CAMPER, FELIX, EVENT_BEAT_CAMPER_FELIX, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "I'm searching for"
	line "firewood."
	cont "Wanna help?"
	done

.BeatenText:
	text "I'll take that as"
	line "a no…"
	done

.AfterText:
	text "We're having a"
	line "barbecue later!"

	para "All I need is some"
	line "firewood for my"
	cont "#mon to light."
	done

TrainerPicnickerLily:
	trainer PICNICKER, LILY, EVENT_BEAT_PICNICKER_LILY, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "I'm hungry!"
	done

.BeatenText:
	text "I was battling on"
	line "an empty stomach!"
	done

.AfterText:
	text "I came here for a"
	line "picnic, but forgot"
	cont "the food!"
	cont "How embarrassing!"
	done

StormyBeachSwimmermText:
	text "We're here on a"
	line "camping trip,"

	para "but the weather"
	line "doesn't look great…"
	done

StormyBeachGrampsText:
	text "Can you feel it in"
	line "the air? A storm"
	cont "is brewing."

	para "A befitting omen"
	line "for those looking"
	cont "to explore the"
	cont "swamp."
	done
