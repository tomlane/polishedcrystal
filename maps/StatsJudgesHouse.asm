StatsJudgesHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 2, 7, 7, CIANWOOD_CITY
	warp_event 3, 7, 7, CIANWOOD_CITY

	db 0 ; coord events

	db 1 ; bg events
	bg_event 7, 1, SIGNPOST_JUMPSTD, difficultbookshelf

	db 1 ; object events
	object_event 2, 3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, StatsJudgeScript, -1

StatsJudgeScript:
	faceplayer
	opentext
	special SpecialStatsJudge
	waitendtext
