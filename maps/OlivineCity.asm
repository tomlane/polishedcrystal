OlivineCity_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, OlivineCityFlyPoint

	db 12 ; warp events
	warp_event 13, 17, 1, OLIVINE_POKECENTER_1F
	warp_event 10, 7, 1, OLIVINE_GYM
	warp_event 25, 7, 1, OLIVINE_TIMS_HOUSE
	warp_event 29, 7, 1, OLIVINE_PUNISHMENT_SPEECH_HOUSE
	warp_event 13, 11, 1, OLIVINE_GOOD_ROD_HOUSE
	warp_event 7, 17, 1, OLIVINE_CAFE
	warp_event 19, 13, 2, OLIVINE_MART
	warp_event 33, 19, 1, OLIVINE_LIGHTHOUSE_1F
	warp_event 19, 31, 1, OLIVINE_PORT_PASSAGE
	warp_event 20, 31, 2, OLIVINE_PORT_PASSAGE
	warp_event 57, 30, 5, ROUTE_35_NATIONAL_PARK_GATE
	warp_event 57, 31, 6, ROUTE_35_NATIONAL_PARK_GATE

	db 2 ; coord events
	coord_event 10, 8, 0, OlivineCityRivalGymScript
	coord_event 33, 23, 0, OlivineCityRivalLighthouseScript

	db 9 ; bg events
	bg_event 17, 7, SIGNPOST_JUMPTEXT, OlivineCitySignText
	bg_event 20, 22, SIGNPOST_JUMPTEXT, OlivineCityPortSignText
	bg_event 7, 7, SIGNPOST_JUMPTEXT, OlivineGymSignText
	bg_event 34, 20, SIGNPOST_JUMPTEXT, OlivineLighthouseSignText
	bg_event 1, 21, SIGNPOST_JUMPTEXT, OlivineCityBattleTowerSignText
	bg_event 50, 27, SIGNPOST_JUMPTEXT, OlivineCityPokeathlonDomeSignText
	bg_event 36, 14, SIGNPOST_ITEM + RARE_CANDY, EVENT_OLIVINE_CITY_HIDDEN_RARE_CANDY
	bg_event 47, 14, SIGNPOST_ITEM + BIG_PEARL, EVENT_OLIVINE_CITY_HIDDEN_BIG_PEARL
	bg_event 49, 29, SIGNPOST_ITEM + SOFT_SAND, EVENT_OLIVINE_CITY_HIDDEN_SOFT_SAND

	db 15 ; object events
	object_event 10, 7, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	object_event 20, 8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OlivineCityYoungster1Script, -1
	object_event 26, 22, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor1Text, -1
	object_event 15, 21, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, (1 << DAY) | (1 << NITE), 0, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor2Text, -1
	object_event 31, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, (1 << MORN) | (1 << DAY), (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCityFisherText, -1
	object_event 31, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, (1 << NITE), 0, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor3Text, -1
	object_event 18, 26, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, (1 << DAY), 0, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCityPokefanFText, -1
	object_event 21, 27, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, (1 << MORN) | (1 << NITE), 0, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCityPokefanMText, -1
	object_event 23, 16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor4Text, -1
	object_event 23, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor5Text, -1
	object_event 26, 11, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, (1 << MORN), (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCityLass1Text, -1
	object_event 28, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, (1 << DAY) | (1 << NITE), (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCityYoungster2Text, -1
	object_event 8, 21, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, (1 << MORN) | (1 << DAY), (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, jumptextfaceplayer, OlivineCityLass2Text, -1
	smashrock_event 52, 23
	smashrock_event 55, 26

	const_def 1 ; object constants
	const OLIVINECITY_OLIVINE_RIVAL

OlivineCityFlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	return

OlivineCityRivalGymScript:
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SILVER
	special MapCallbackSprites_LoadUsedSpritesGFX
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	playsound SFX_TACKLE
	applymovement PLAYER, OlivineCityMovementData_ShovePlayerDown
	applyonemovement OLIVINECITY_OLIVINE_RIVAL, step_down
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext OlivineCityRivalGymText
	spriteface PLAYER, RIGHT
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityMovementData_RivalLeavesGym
	dotrigger $1
	disappear OLIVINECITY_OLIVINE_RIVAL
	special RestartMapMusic
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_COWGIRL
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

OlivineCityRivalLighthouseScript:
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	moveperson OLIVINECITY_OLIVINE_RIVAL, 33, 19
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SILVER
	special MapCallbackSprites_LoadUsedSpritesGFX
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityMovementData_RivalExitsLighthouse
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext OlivineCityRivalLighthouseText
	playsound SFX_TACKLE
	applymovement PLAYER, OlivineCityMovementData_ShovePlayerDown2
	spriteface PLAYER, LEFT
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityMovementData_RivalLeavesLighthouse
	dotrigger $1
	disappear OLIVINECITY_OLIVINE_RIVAL
	special RestartMapMusic
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_COWGIRL
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

OlivineCityYoungster1Script:
	faceplayer
	opentext
	random $2
	if_equal $0, UnknownScript_0x1a88b4
	jumpopenedtext UnknownText_0x1a8b04

UnknownScript_0x1a88b4:
	jumpopenedtext UnknownText_0x1a8b41

OlivineCityMovementData_ShovePlayerDown:
	turn_head_up
	fix_facing
	step_down
	remove_fixed_facing
	step_end

OlivineCityMovementData_RivalExitsLighthouse:
	step_down
	step_down
	step_down
	step_end

OlivineCityMovementData_RivalLeavesGym:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

OlivineCityMovementData_ShovePlayerDown2:
	turn_head_up
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end

OlivineCityMovementData_RivalLeavesLighthouse:
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

OlivineCityRivalGymText:
	text "…"

	para "You again?"

	para "There's no need to"
	line "panic. I don't"

	para "bother with wimps"
	line "like you."

	para "Speaking of weak-"
	line "lings, the city's"

	para "Gym Leader isn't"
	line "here."

	para "Supposedly taking"
	line "care of a sick"

	para "#mon at the"
	line "Lighthouse."

	para "Humph! Boo-hoo!"
	line "Just let sick"
	cont "#mon go!"

	para "A #mon that"
	line "can't battle is"
	cont "worthless!"

	para "Why don't you go"
	line "train at the"
	cont "Lighthouse?"

	para "Who knows. It may"
	line "make you a bit"
	cont "less weak!"
	done

OlivineCityRivalLighthouseText:
	text "…"

	para "You again?"

	para "There's no need to"
	line "panic. I don't"

	para "bother with wimps"
	line "like you."

	para "Speaking of weak-"
	line "lings, the city's"

	para "Gym Leader is"
	line "taking care of a"

	para "sick #mon in"
	line "the Lighthouse."

	para "Humph! Boo-hoo!"
	line "Just let sick"
	cont "#mon go!"

	para "A #mon that"
	line "can't battle is"
	cont "worthless!"

	para "Why don't you go"
	line "train inside?"

	para "Who knows. It may"
	line "make you a bit"
	cont "less weak!"
	done

UnknownText_0x1a8b04:
	text "That thing you"
	line "have--it's a #-"
	cont "gear, right? Wow,"
	cont "that's cool."
	done

UnknownText_0x1a8b41:
	text "Wow, you have a"
	line "#dex!"

	para "That is just so"
	line "awesome."
	done

OlivineCitySailor1Text:
	text "Dark roads are"
	line "dangerous at"
	cont "night."

	para "But in the pitch-"
	line "black of night,"

	para "the sea is even"
	line "more treacherous!"

	para "Without the beacon"
	line "of the Lighthouse"

	para "to guide it, no"
	line "ship can sail."
	done

OlivineCitySailor2Text:
	text "The sea is sweet!"

	para "Sunsets on the sea"
	line "are marvelous!"

	para "Sing with me!"
	line "♪ Yo-ho! Blow the"
	cont "man down!… ♪"
	done

OlivineCityFisherText:
	text "You remind me of"
	line "a kid who used to"
	cont "live here."

	para "The family moved"
	line "away when their"

	para "father became a"
	line "Gym Leader in"
	cont "another region."
	done

OlivineCitySailor3Text:
	text "To see the Light-"
	line "house illuminate"

	para "the sea at night--"
	line "it's beautiful!"
	done

OlivineCityPokefanFText:
	text "Have you been to"
	line "Olivine Café?"

	para "The food is"
	line "delicious."
	done

OlivineCityPokefanMText:
	text "Most trainers who"
	line "visit Olivine head"

	para "straight for the"
	line "Battle Tower."

	para "Only the best can"
	line "compete there."
	done

OlivineCitySailor4Text:
	text "♪ A home like"
	line "O-li-vine,"

	para "I'm so hap-py I"
	line "can call you mine,"

	para "Next to the deep"
	line "blue brine,"

	para "Ci-ty oh so"
	line "di-vine,"

	para "Shine bright my"
	line "O-li-vine!… ♪"
	done

OlivineCitySailor5Text:
	text "Us sailors love"
	line "a sing-song."
	cont "Join in!"

	para "♪ From off the"
	line "plank,"

	para "'twas then he"
	line "thank,"

	para "oh fiddle-dee"
	line "fiddle-dee dee… ♪"
	done

OlivineCityLass1Text:
	text "The sailors here"
	line "may seem like a"

	para "handful, but"
	line "they're harmless."
	done

OlivineCityYoungster2Text:
	text "Why do sailors"
	line "like singing so"
	cont "much?"

	para "I don't get it."
	done

OlivineCityLass2Text:
	text "Jasmine, our Gym"
	line "Leader, is a shy"

	para "girl. She's no"
	line "pushover, mind!"
	done

OlivineCitySignText:
	text "Olivine City"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "Olivine Port"
	line "Fast Ship Pier"
	done

OlivineGymSignText:
	text "Olivine City"
	line "#mon Gym"
	cont "Leader: Jasmine"

	para "The Steel-Clad"
	line "Defense Girl"
	done

OlivineLighthouseSignText:
	text "Olivine Lighthouse"
	line "Also known as the"
	cont "Glitter Lighthouse"
	done

OlivineCityBattleTowerSignText:
	text "Battle Tower Ahead"
	line "Opening Now!"
	done

OlivineCityPokeathlonDomeSignText:
	text "The #athlon"
	line "Project Has"
	cont "Started!"
	done
