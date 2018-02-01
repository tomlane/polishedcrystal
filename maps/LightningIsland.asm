LightningIsland_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 6 ; warp events
	warp_event 5, 29, 3, SHAMOUTI_COAST
	warp_event 19, 29, 1, LIGHTNING_ISLAND_ROOF
	warp_event 6, 3, 4, LIGHTNING_ISLAND
	warp_event 19, 3, 3, LIGHTNING_ISLAND
	warp_event 19, 26, 6, LIGHTNING_ISLAND
	warp_event 5, 27, 5, LIGHTNING_ISLAND ; hole

	db 0 ; coord events

	db 0 ; bg events

	db 14 ; object events
	itemball_event 22, 15, DAMP_ROCK, 1, EVENT_LIGHTNING_ISLAND_DAMP_ROCK
	object_event 1, 5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 1, 13, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 1, 25, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 15, 6, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 15, 11, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 15, 27, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 10, 6, SPRITE_SNES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 10, 18, SPRITE_SNES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 10, 22, SPRITE_SNES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 24, 4, SPRITE_SNES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 24, 8, SPRITE_SNES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 24, 17, SPRITE_SNES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1
	object_event 24, 25, SPRITE_SNES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, LightningIslandCrystalScript, -1

LightningIslandCrystalScript:
	end
