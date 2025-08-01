; significant level values
DEF MAX_LEVEL EQU 100
DEF MIN_LEVEL EQU 2
DEF EGG_LEVEL EQU 1

; maximum moves known per mon
DEF NUM_MOVES EQU 4

; significant stat values
DEF BASE_STAT_LEVEL EQU 7
DEF MAX_STAT_LEVEL EQU 13

; turns that sleep lasts
DEF REST_SLEEP_TURNS EQU 2
DEF TREEMON_SLEEP_TURNS EQU 3

; default move priority
DEF BASE_PRIORITY EQU 1

; type effectiveness factors, Q28.4 fixed-point for better doubling/halving
DEF SUPER_EFFECTIVE    EQU 2.0q4 ; $20
DEF EFFECTIVE          EQU 1.0q4 ; $10
DEF NOT_VERY_EFFECTIVE EQU 0.5q4 ; $08
DEF NO_EFFECT          EQU 0.0q4 ; $00

; enemy AI behavior
DEF BASE_AI_SWITCH_SCORE EQU 10

; wPlayerStatLevels and wEnemyStatLevels indexes (see wram.asm)
; GetStatName arguments (see data/battle/stat_names.asm)
	const_def
	const ATTACK
	const DEFENSE
	const SPEED
	const SP_ATTACK
	const SP_DEFENSE
	const ACCURACY
	const EVASION
	const MULTIPLE_STATS ; used for BattleCommand_Curse
DEF NUM_LEVEL_STATS EQU const_value

; move struct members (see data/moves/moves.asm)
rsreset
DEF MOVE_ANIM     rb ; 0
DEF MOVE_EFFECT   rb ; 1
DEF MOVE_POWER    rb ; 2
DEF MOVE_TYPE     rb ; 3
DEF MOVE_ACC      rb ; 4
DEF MOVE_PP       rb ; 5
DEF MOVE_CHANCE   rb ; 6
DEF MOVE_CATEGORY rb ; 7
DEF MOVE_LENGTH EQU _RS

; stat constants
; indexes for:
; - wPlayerStats and wEnemyStats (see wram.asm)
; - party_struct and battle_struct members (see macros/ram.asm)
; - GetStatString arguments (see data/battle/stat_strings.asm)
	const_def 1
	const STAT_HP
	const STAT_ATK
	const STAT_DEF
	const STAT_SPE
	const STAT_SATK
	const STAT_SDEF
DEF NUM_STATS EQU const_value - 1
DEF NUM_BATTLE_STATS EQU NUM_STATS - 1 ; don't count HP

; stat formula constants
DEF STAT_MIN_NORMAL EQU 5
DEF STAT_MIN_HP EQU 10

; FarChangeStat arguments (see engine/battle/stats.asm)
	const_def
	const STAT_TARGET_F
	const STAT_LOWER_F
	const STAT_CANMISS_F
	const STAT_SECONDARY_F
	const STAT_SILENT_F
	const STAT_SKIPTEXT_F

DEF STAT_TARGET    EQU 1 << STAT_TARGET_F
DEF STAT_LOWER     EQU 1 << STAT_LOWER_F
DEF STAT_CANMISS   EQU 1 << STAT_CANMISS_F
DEF STAT_SECONDARY EQU 1 << STAT_SECONDARY_F
DEF STAT_SILENT    EQU 1 << STAT_SILENT_F
DEF STAT_SKIPTEXT  EQU 1 << STAT_SKIPTEXT_F

; battle classes (wBattleMode values)
	const_def 1
	const WILD_BATTLE
	const TRAINER_BATTLE

; battle types (wBattleType values)
	const_def
	const BATTLETYPE_NORMAL
	const BATTLETYPE_CANLOSE
	const BATTLETYPE_TUTORIAL
	const BATTLETYPE_FISH
	const BATTLETYPE_TREE
	const BATTLETYPE_ROAMING
	const BATTLETYPE_CONTEST
	const BATTLETYPE_SAFARI
	const BATTLETYPE_GHOST
	const BATTLETYPE_GROTTO
	const BATTLETYPE_INVERSE

	; constants below this is assumed to be unfleeable
	const BATTLETYPE_TRAP
	const BATTLETYPE_FORCEITEM
	const BATTLETYPE_NEVER_SHINY
	const BATTLETYPE_LEGENDARY

; BattleVarPairs indexes (see home/battle_vars.asm)
	const_def
	const BATTLE_VARS_SUBSTATUS1
	const BATTLE_VARS_SUBSTATUS2
	const BATTLE_VARS_SUBSTATUS3
	const BATTLE_VARS_SUBSTATUS4
	const BATTLE_VARS_SUBSTATUS1_OPP
	const BATTLE_VARS_SUBSTATUS2_OPP
	const BATTLE_VARS_SUBSTATUS3_OPP
	const BATTLE_VARS_SUBSTATUS4_OPP
	const BATTLE_VARS_ABILITY
	const BATTLE_VARS_ABILITY_OPP
	const BATTLE_VARS_STATUS
	const BATTLE_VARS_STATUS_OPP
	const BATTLE_VARS_MOVE_ANIM
	const BATTLE_VARS_MOVE_EFFECT
	const BATTLE_VARS_MOVE_POWER
	const BATTLE_VARS_MOVE_ACCURACY
	const BATTLE_VARS_MOVE_TYPE
	const BATTLE_VARS_MOVE_CATEGORY
	const BATTLE_VARS_MOVE
	const BATTLE_VARS_MOVE_OPP
	const BATTLE_VARS_LAST_COUNTER_MOVE
	const BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	const BATTLE_VARS_LAST_MOVE
	const BATTLE_VARS_LAST_MOVE_OPP
	const BATTLE_VARS_CUD_CHEW_BERRY
DEF NUM_BATTLE_VARS EQU const_value

; BattleVarLocations indexes (see home/battle_vars.asm)
	const_def
	const PLAYER_SUBSTATUS_1
	const ENEMY_SUBSTATUS_1
	const PLAYER_SUBSTATUS_2
	const ENEMY_SUBSTATUS_2
	const PLAYER_SUBSTATUS_3
	const ENEMY_SUBSTATUS_3
	const PLAYER_SUBSTATUS_4
	const ENEMY_SUBSTATUS_4
	const PLAYER_ABILITY
	const ENEMY_ABILITY
	const PLAYER_STATUS
	const ENEMY_STATUS
	const PLAYER_MOVE_ANIMATION
	const ENEMY_MOVE_ANIMATION
	const PLAYER_MOVE_EFFECT
	const ENEMY_MOVE_EFFECT
	const PLAYER_MOVE_POWER
	const ENEMY_MOVE_POWER
	const PLAYER_MOVE_ACCURACY
	const ENEMY_MOVE_ACCURACY
	const PLAYER_MOVE_TYPE
	const ENEMY_MOVE_TYPE
	const PLAYER_MOVE_CATEGORY
	const ENEMY_MOVE_CATEGORY
	const PLAYER_CUR_MOVE
	const ENEMY_CUR_MOVE
	const PLAYER_COUNTER_MOVE
	const ENEMY_COUNTER_MOVE
	const PLAYER_LAST_MOVE
	const ENEMY_LAST_MOVE
	const PLAYER_CUD_CHEW_BERRY
	const ENEMY_CUD_CHEW_BERRY
assert const_value % 2 == 0
DEF NUM_BATTLE_VAR_LOCATION_PAIRS EQU const_value / 2

; status condition bit flags
DEF SLP_MASK EQU %111 ; 0-7 turns
	const_def 3
	const PSN
	const BRN
	const FRZ
	const PAR
	const TOX

DEF ALL_STATUS EQU (1 << PSN) | (1 << BRN) | (1 << FRZ) | (1 << PAR) | (1 << TOX) | SLP_MASK

; wPlayerSubStatus1 or wEnemySubStatus1 bit flags
	const_def
	const SUBSTATUS_UNBURDEN
	const SUBSTATUS_CURSE
	const SUBSTATUS_PROTECT
	const SUBSTATUS_IDENTIFIED
	const_skip
	const SUBSTATUS_ENDURE
	const SUBSTATUS_FLASH_FIRE
	const SUBSTATUS_IN_LOVE

; wPlayerSubStatus2 or wEnemySubStatus2 bit flags
	const_def
	const_skip
	const SUBSTATUS_MINIMIZED
	const SUBSTATUS_FAINTED
	const SUBSTATUS_IN_ABILITY
	const SUBSTATUS_TRANSFORMED
	const SUBSTATUS_LOCK_ON
	const SUBSTATUS_DESTINY_BOND
	const SUBSTATUS_CANT_RUN

; wPlayerSubStatus3 or wEnemySubStatus3 bit flags
	const_def
	const SUBSTATUS_ROLLOUT
	const SUBSTATUS_RAMPAGE
	const SUBSTATUS_IN_LOOP
	const SUBSTATUS_RECHARGE
	const SUBSTATUS_CHARGED
	const SUBSTATUS_UNDERGROUND
	const SUBSTATUS_FLYING
	const SUBSTATUS_CONFUSED

; wPlayerSubStatus4 or wEnemySubStatus4 bit flags
	const_def
	const SUBSTATUS_CURLED
	const SUBSTATUS_PENDING_ITEMLOSS
	const SUBSTATUS_FOCUS_ENERGY
	const SUBSTATUS_ROOST
	const SUBSTATUS_SUBSTITUTE
	const SUBSTATUS_FLINCHED
	const SUBSTATUS_RAGE
	const SUBSTATUS_LEECH_SEED

DEF SEMI_INVULNERABLE_MASK EQU 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND

; wPlayerHazards or wEnemyHazards bit masks (stackable)
DEF HAZARDS_SPIKES       EQU %00110000
DEF HAZARDS_TOXIC_SPIKES EQU %11000000

; wPlayerScreens or wEnemyScreens bit masks (stackable)
DEF SCREENS_REFLECT      EQU %00001111
DEF SCREENS_LIGHT_SCREEN EQU %11110000

; wPlayerGuards or wEnemyGuards bit masks (stackable)
DEF GUARD_SAFEGUARD EQU %00001111
DEF GUARD_MIST      EQU %11110000

; values in wBattleWeather
	const_def
	const WEATHER_NONE
	const WEATHER_RAIN
	const WEATHER_SUN
	const WEATHER_SANDSTORM
	const WEATHER_HAIL

; wAttackMissed (higher gives priority)
	const_def 1
	const ATKFAIL_MISSED    ; "<USER>'s attack missed!"
	const ATKFAIL_PROTECT   ; "<TARGET> is protecting itself!"
	const ATKFAIL_ABILITY   ; ability immunity, might have side effects
	const ATKFAIL_GENERIC   ; "But it failed!"
	const ATKFAIL_IMMUNE    ; "It doesn't affect <TARGET>!"
	const ATKFAIL_AFFECTION ; Evaded due to high Affection
	const ATKFAIL_ACCMISS   ; missed from accuracy
	const ATKFAIL_CUSTOM    ; custom message

; wMoveHitState
	const_def
	const MOVEHIT_CRITICAL
	const MOVEHIT_SUBSTITUTE

; wDeferredSwitch
	const_def
	const SWITCH_DEFERRED
	const SWITCH_EXPLICIT
	const SWITCH_TARGET
	const SWITCH_FORCED
	const SWITCH_PURSUIT
	const SWITCH_ITEM
	const SWITCH_OPPITEM
	const SWITCH_BATON_PASS

; wBattleAction
	const_def
	const BATTLEACTION_MOVE1
	const BATTLEACTION_MOVE2
	const BATTLEACTION_MOVE3
	const BATTLEACTION_MOVE4
	const BATTLEACTION_SWITCH1
	const BATTLEACTION_SWITCH2
	const BATTLEACTION_SWITCH3
	const BATTLEACTION_SWITCH4
	const BATTLEACTION_SWITCH5
	const BATTLEACTION_SWITCH6
	const_skip
	const_skip
	const_skip
	const BATTLEACTION_STRUGGLE
	const BATTLEACTION_FORFEIT

; wBattlePlayerAction
	const_def
	const BATTLEPLAYERACTION_USEMOVE
	const BATTLEPLAYERACTION_USEITEM
	const BATTLEPLAYERACTION_SWITCH

; wBattleMenuFlags
	const_def
	const QUICK_B_F
	const QUICK_START_F
	const QUICK_SELECT_F
	const QUICK_PACK_F

DEF QUICK_B      EQU 1 << QUICK_B_F
DEF QUICK_START  EQU 1 << QUICK_START_F
DEF QUICK_SELECT EQU 1 << QUICK_SELECT_F
DEF QUICK_PACK   EQU 1 << QUICK_PACK_F

; wBattleResult
	const_def
	const WIN
	const LOSE
	const DRAW

	const_def 6
	const BATTLERESULT_CAUGHT_POKEMON_F ; 6
	const BATTLERESULT_BOX_FULL_F       ; 7
DEF BATTLERESULT_BITMASK EQU (1 << BATTLERESULT_CAUGHT_POKEMON_F) | (1 << BATTLERESULT_BOX_FULL_F)

; link_battle_record struct
DEF LINK_BATTLE_RECORD_LENGTH EQU 2 + (NAME_LENGTH - 1) + 2 * 3
DEF NUM_LINK_BATTLE_RECORDS EQU 5

; used in data/trainers/dvs.asm
DEF PERFECT_DVS EQUS "$ff, $ff, $ff"
