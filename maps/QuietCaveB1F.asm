QuietCaveB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 9 ; warp events
	warp_event 5, 25, 2, QUIET_CAVE_1F
	warp_event 29, 23, 3, QUIET_CAVE_1F
	warp_event 19, 11, 4, QUIET_CAVE_1F
	warp_event 3, 15, 5, QUIET_CAVE_1F
	warp_event 31, 15, 6, QUIET_CAVE_1F
	warp_event 21, 3, 1, QUIET_CAVE_B2F
	warp_event 17, 25, 2, QUIET_CAVE_B2F
	warp_event 23, 33, 3, QUIET_CAVE_B2F
	warp_event 32, 2, 4, QUIET_CAVE_B2F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 26, 33, SIGNPOST_ITEM + HYPER_POTION, EVENT_QUIET_CAVE_B1F_HIDDEN_HYPER_POTION

	db 6 ; object events
	object_event 25, 4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBattleGirlKagami, -1
	object_event 21, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 4, TrainerPokemaniacAidan, -1
	object_event 33, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerHikerSteve, -1
	object_event 4, 7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 2, TrainerPsychicVirgil, -1
	itemball_event 8, 3, BIG_PEARL, 1, EVENT_QUIET_CAVE_B1F_BIG_PEARL
	itemball_event 14, 13, ELIXER, 1, EVENT_QUIET_CAVE_B1F_ELIXIR

TrainerBattleGirlKagami:
	trainer BATTLE_GIRL, KAGAMI, EVENT_BEAT_BATTLE_GIRL_KAGAMI, BattleGirlKagamiSeenText, BattleGirlKagamiBeatenText, 0, BattleGirlKagamiScript

BattleGirlKagamiScript:
	end_if_just_battled
	jumptextfaceplayer BattleGirlKagamiAfterText

TrainerPokemaniacAidan:
	trainer POKEMANIAC, AIDAN, EVENT_BEAT_POKEMANIAC_AIDAN, PokemaniacAidanSeenText, PokemaniacAidanBeatenText, 0, PokemaniacAidanScript

PokemaniacAidanScript:
	end_if_just_battled
	jumptextfaceplayer PokemaniacAidanAfterText

TrainerHikerSteve:
	trainer HIKER, STEVE, EVENT_BEAT_HIKER_STEVE, HikerSteveSeenText, HikerSteveBeatenText, 0, HikerSteveScript

HikerSteveScript:
	end_if_just_battled
	jumptextfaceplayer HikerSteveAfterText

TrainerPsychicVirgil:
	trainer PSYCHIC_T, VIRGIL, EVENT_BEAT_PSYCHIC_VIRGIL, PsychicVirgilSeenText, PsychicVirgilBeatenText, 0, PsychicVirgilScript

PsychicVirgilScript:
	end_if_just_battled
	jumptextfaceplayer PsychicVirgilAfterText

BattleGirlKagamiSeenText:
	text "Don't disturb my"
	line "training!"
	done

BattleGirlKagamiBeatenText:
	text "Not good enough…"
	done

BattleGirlKagamiAfterText:
	text "I come here to"
	line "train in peace"
	cont "and solitude."
	done

PokemaniacAidanSeenText:
	text "My #mon!"

	para "Let me show"
	line "you them!"
	done

PokemaniacAidanBeatenText:
	text "My #mon…"
	done

PokemaniacAidanAfterText:
	text "Sometimes a"
	line "#mon in a"

	para "certain area will"
	line "know a rare move."
	done

HikerSteveSeenText:
	text "They call me a"
	line "Hiker, but right"

	para "now I'm a spelunk-"
	line "er!"
	done

HikerSteveBeatenText:
	text "And now I'm a"
	line "loser…"
	done

HikerSteveAfterText:
	text "Spelunking is also"
	line "called caving."

	para "It means exploring"
	line "caves!"
	done

PsychicVirgilSeenText:
	text "Shh! Be quiet!"
	done

PsychicVirgilBeatenText:
	text "Why must battling"
	line "be so loud?"
	done

PsychicVirgilAfterText:
	text "The silence helps"
	line "focus my ESP."
	done
