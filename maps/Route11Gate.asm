Route11Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 5 ; warp events
	warp_event 0, 5, 1, ROUTE_11
	warp_event 0, 6, 2, ROUTE_11
	warp_event 9, 5, 2, ROUTE_12_SOUTH
	warp_event 9, 6, 3, ROUTE_12_SOUTH
	warp_event 8, 8, 1, ROUTE_11_GATE_2F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 5, 1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, Route11GateOfficerText, -1

Route11GateOfficerText:
	text "When you catch"
	line "lots of #mon,"
	cont "isn't it hard to"
	cont "think up names?"

	para "In Lavender Town,"
	line "there's a man who"
	cont "rates #mon"
	cont "nicknames."

	para "He'll help you"
	line "rename them too!"
	done
