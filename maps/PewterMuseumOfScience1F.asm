PewterMuseumOfScience1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 5 ; warp events
	warp_event 10, 7, 6, PEWTER_CITY
	warp_event 11, 7, 6, PEWTER_CITY
	warp_event 16, 7, 7, PEWTER_CITY
	warp_event 17, 7, 7, PEWTER_CITY
	warp_event 7, 7, 1, PEWTER_MUSEUM_OF_SCIENCE_2F

	db 0 ; coord events

	db 9 ; bg events
	bg_event 2, 3, SIGNPOST_READ, KabutopsFossilSignpostScript
	bg_event 6, 3, SIGNPOST_READ, OmastarFossilSignpostScript
	bg_event 3, 6, SIGNPOST_READ, AerodactylFossilSignpostScript
	bg_event 12, 1, SIGNPOST_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 13, 1, SIGNPOST_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 14, 1, SIGNPOST_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 15, 1, SIGNPOST_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 17, 1, SIGNPOST_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 18, 1, SIGNPOST_JUMPTEXT, Museum1FBookshelfSignpostText

	db 5 ; object events
	object_event 18, 3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Museum1FFossilScientistScript, -1
	object_event 12, 4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Museum1FReceptionistScript, -1
	object_event 16, 2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_COMMAND, jumptextfaceplayer, Museum1FScientistText, -1
	object_event 1, 7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, Museum1FGrampsText, -1
	object_event 4, 3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, Museum1FYoungsterText, -1

	const_def 1 ; object constants
	const PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2

Museum1FFossilScientistScript:
	faceplayer
	opentext
	writetext Museum1FFossilScientistText
	waitbutton
	checkitem HELIX_FOSSIL
	iftrue .own_helix
	checkitem DOME_FOSSIL
	iftrue .own_dome
	checkitem OLD_AMBER
	iftrue .ask_old_amber
	jumpopenedtext NoFossilsText

.own_helix
	checkitem DOME_FOSSIL
	iftrue .own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_amber
	writetext AskHelixFossilText
	yesorno
	iftrue ResurrectHelixFossil
	jump .maybe_later

.own_dome
	checkitem OLD_AMBER
	iftrue .ask_dome_amber
	writetext AskDomeFossilText
	yesorno
	iftrue ResurrectDomeFossil
	jump .maybe_later

.own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_dome_amber
	loadmenudata HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, ResurrectHelixFossil
	if_equal $2, ResurrectDomeFossil
	jump .maybe_later

.ask_old_amber
	writetext AskOldAmberText
	yesorno
	iftrue ResurrectOldAmber
	jump .maybe_later

.ask_helix_amber
	loadmenudata HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, ResurrectHelixFossil
	if_equal $2, ResurrectOldAmber
	jump .maybe_later

.ask_dome_amber
	loadmenudata DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, ResurrectDomeFossil
	if_equal $2, ResurrectOldAmber
	jump .maybe_later

.ask_helix_dome_amber
	loadmenudata HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, ResurrectHelixFossil
	if_equal $2, ResurrectDomeFossil
	if_equal $3, ResurrectOldAmber
.maybe_later:
	jumpopenedtext MaybeLaterText

HelixDomeMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Cancel@"

HelixAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Helix Fossil@"
	db "Old Amber@"
	db "Cancel@"

DomeAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Dome Fossil@"
	db "Old Amber@"
	db "Cancel@"

HelixDomeAmberMenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Old Amber@"
	db "Cancel@"

ResurrectHelixFossil:
	checkcode VAR_PARTYCOUNT
	if_equal $6, NoRoomForFossilPokemon
	takeitem HELIX_FOSSIL
	scall ResurrectAFossilScript
	writetext GotOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 20
	jumpopenedtext TakeGoodCareOfItText

ResurrectDomeFossil:
	checkcode VAR_PARTYCOUNT
	if_equal $6, NoRoomForFossilPokemon
	takeitem DOME_FOSSIL
	scall ResurrectAFossilScript
	writetext GotKabutoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 20
	jumpopenedtext TakeGoodCareOfItText

ResurrectOldAmber:
	checkcode VAR_PARTYCOUNT
	if_equal $6, NoRoomForFossilPokemon
	takeitem OLD_AMBER
	scall ResurrectAFossilScript
	writetext GotAerodactylText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 20
	jumpopenedtext TakeGoodCareOfItText

ResurrectAFossilScript:
	writetext ResurrectingPokemonText
	waitbutton
	closetext
	spriteface PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2, RIGHT
	pause 15
	playsound SFX_BOOT_PC
	waitsfx
	pause 30
	playsound SFX_4_NOTE_DITTY
	waitsfx
	pause 5
	waitsfx
	pause 30
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	faceplayer
	opentext
	end

NoRoomForFossilPokemon:
	jumpopenedtext NoRoomForFossilPokemonText

Museum1FReceptionistScript:
	faceplayer
	opentext
	checkcode VAR_FACING
	if_equal DOWN, .Sneak
	if_equal LEFT, .Sneak
	jumpopenedtext Museum1FReceptionistText1

.Sneak:
	jumpopenedtext Museum1FReceptionistText2

KabutopsFossilSignpostScript:
	refreshscreen
	trainerpic KABUTOPS_FOSSIL
	waitbutton
	closepokepic
	jumptext KabutopsFossilSignpostText

OmastarFossilSignpostScript:
	refreshscreen
	trainerpic OMASTAR_FOSSIL
	waitbutton
	closepokepic
	jumptext OmastarFossilSignpostText

AerodactylFossilSignpostScript:
	refreshscreen
	trainerpic AERODACTYL_FOSSIL
	waitbutton
	closepokepic
	jumptext AerodactylFossilSignpostText

Museum1FReceptionistText1:
	text "Welcome!"

	para "Thanks to a gene-"
	line "rous donation"
	cont "by Silph Co.,"

	para "admission is free"
	line "of charge!"

	para "Please go ahead."
	done

Museum1FReceptionistText2:
	text "You can't sneak"
	line "in the back way!"
	done

Museum1FScientistText:
	text "We are proud of"
	line "three fossils of"

	para "rare, prehistoric"
	line "#mon."

	para "I helped assemble"
	line "them!"
	done

Museum1FFossilScientistText:
	text "Did you know that"
	line "you can extract"

	para "#mon from"
	line "fossils?"

	para "If you ever need"
	line "to, let me take"
	cont "care of it!"
	done

Museum1FGrampsText:
	text "That is one"
	line "magnificent"
	cont "fossil!"
	done

Museum1FYoungsterText:
	text "There are two"
	line "places that I"
	cont "love!"

	para "One is the Ruins"
	line "of Alph in Johto."

	para "The other is the"
	line "Pewter Museum!"

	para "I get a sense of"
	line "history from both"
	cont "of them."
	done

KabutopsFossilSignpostText:
	text "Kabutops Fossil"
	line "(Dome)"

	para "A primitive and"
	line "rare Pokémon."
	done

OmastarFossilSignpostText:
	text "Omastar Fossil"
	line "(Helix)"

	para "A primitive and"
	line "rare Pokémon."
	done

AerodactylFossilSignpostText:
	text "Aerodactyl Fossil"

	para "A primitive and"
	line "rare Pokémon."
	done

Museum1FBookshelfSignpostText:
	text "Thick and well-"
	line "read books!"

	para "Archaeology Man-"
	line "ual, Lost #mon,"
	cont "#mon Ancestors,"

	para "Caring at the"
	line "Loamy Layer of"
	cont "Kanto…"
	done

AskHelixFossilText:
	text "Do you want to"
	line "resurrect the"
	cont "Helix Fossil?"
	done

AskDomeFossilText:
	text "Do you want to"
	line "resurrect the"
	cont "Dome Fossil?"
	done

AskOldAmberText:
	text "Do you want to"
	line "resurrect the"
	cont "Old Amber?"
	done

NoFossilsText:
	text "Hey! You don't"
	line "have any fossils."
	done

MaybeLaterText:
	text "Just talk to me"
	line "if you change"
	cont "your mind."
	done

ResurrectingPokemonText:
	text "OK! I'll resurrect"
	line "the #mon!"
	done

NoRoomForFossilPokemonText:
	text "Hey! You can't"
	line "carry another"
	cont "#mon."
	done

GotOmanyteText:
	text "<PLAYER> received"
	line "Omanyte."
	done

GotKabutoText:
	text "<PLAYER> received"
	line "Kabuto."
	done

GotAerodactylText:
	text "<PLAYER> received"
	line "Aerodactyl."
	done

TakeGoodCareOfItText:
	text "Take good care"
	line "of it!"
	done
