const_value set 2
	const WARMBEACHHOUSE_GRAMPS
	const WARMBEACHHOUSE_GRANNY
	const WARMBEACHHOUSE_BOOK

WarmBeachHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WarmBeachHouseGrampsScript:
	jumptextfaceplayer .Text

.Text:
	text "TODO"
	done

WarmBeachHouseGrannyScript:
	jumptextfaceplayer .Text

.Text:
	text "TODO"
	done

WarmBeachHouseBookScript:
	opentext
	writetext .Text0
	yesorno
	iffalse .Done
	writetext .Text1
	yesorno
	iffalse .Done
	writetext .Text2
	yesorno
	iffalse .Done
	writetext .Text3
	waitbutton
.Done
	closetext
	end

.Text0:
	text "The Shamouti"
	line "Prophecy"

	para "Want to read it?"
	done

.Text1:
	text "Disturb not the"
	line "harmony of fire,"
	cont "ice, or lightning,"

	para "lest these titans"
	line "wreak destruction"
	cont "upon the world in"
	cont "which they clash."

	para "Though the water's"
	line "great guardian sh-"
	cont "all arise to quell"
	cont "the fighting,"

	para "alone its song"
	line "will fail, and"
	cont "thus the earth"
	cont "shall turn to ash."

	para "Keep reading?"
	done

.Text2:
	text "O Chosen One,"
	line "into thine hands"
	cont "bring together"
	cont "all three."

	para "Their treasures"
	line "combined tame the"
	cont "beast of the sea."

	para "Keep reading?"
	done

.Text3:
	text "From the trio of"
	line "islands, ancient"
	cont "spheres shall you"
	cont "take."

	para "For between life"
	line "and death, all the"
	cont "difference you'll"
	cont "make."

	para "Climb to the"
	line "shrine to right"
	cont "what is wrong,"

	para "and the world"
	line "shall be healed"
	cont "by the guardian's"
	cont "song…"
	done

WarmBeachHouse_MapEventHeader:
.Warps:
	db 2
	warp_def $7, $2, 3, WARM_BEACH
	warp_def $7, $3, 3, WARM_BEACH

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, WarmBeachHouseGrampsScript, -1
	person_event SPRITE_GRANNY, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, WarmBeachHouseGrannyScript, -1
	person_event SPRITE_BOOK_UNOWN_R, 3, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, WarmBeachHouseBookScript, -1
