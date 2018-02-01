SafariZoneHub_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 9 ; warp events
	warp_event 16, 27, 1, SAFARI_ZONE_FUCHSIA_GATE
	warp_event 17, 27, 2, SAFARI_ZONE_FUCHSIA_GATE
	warp_event 31, 12, 1, SAFARI_ZONE_EAST
	warp_event 31, 13, 2, SAFARI_ZONE_EAST
	warp_event 2, 12, 5, SAFARI_ZONE_WEST
	warp_event 2, 13, 6, SAFARI_ZONE_WEST
	warp_event 16, 2, 5, SAFARI_ZONE_NORTH
	warp_event 17, 2, 6, SAFARI_ZONE_NORTH
	warp_event 19, 21, 1, SAFARI_ZONE_HUB_REST_HOUSE

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16, 24, SIGNPOST_JUMPTEXT, SafariZoneHubAreaSignText
	bg_event 20, 22, SIGNPOST_JUMPTEXT, SafariZoneHubRestHouseSignText

	db 3 ; object events
	object_event 26, 6, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 5, TrainerBug_maniacKai, -1
	itemball_event 15, 12, NUGGET, 1, EVENT_SAFARI_ZONE_HUB_NUGGET
	itemball_event 8, 21, ULTRA_BALL, 1, EVENT_SAFARI_ZONE_HUB_ULTRA_BALL

TrainerBug_maniacKai:
	trainer BUG_MANIAC, KAI, EVENT_BEAT_BUG_MANIAC_KAI, Bug_maniacKaiSeenText, Bug_maniacKaiBeatenText, 0, Bug_maniacKaiScript

Bug_maniacKaiScript:
	end_if_just_battled
	jumptextfaceplayer Bug_maniacKaiAfterText

Bug_maniacKaiSeenText:
	text "My Venonat evolved"
	line "into a Venomoth?!"
	done

Bug_maniacKaiBeatenText:
	text "I thought it would"
	line "for sure evolve"
	cont "into Butterfree!"
	done

Bug_maniacKaiAfterText:
	text "Venonat is so"
	line "similar to"
	cont "Butterfree!"

	para "Their weight,"
	line "their eyes,"
	cont "their abilities…"

	para "Evolution is"
	line "weird sometimes."
	done

SafariZoneHubAreaSignText:
	text "Safari Zone"
	line "Center Area"
	done

SafariZoneHubRestHouseSignText:
	text "Rest House"
	done
