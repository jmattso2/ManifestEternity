class_name Battlefield
extends Resource

@export_group("Layout Data")
@export var rows: int
@export var columns: int
@export var player_mothership_position: HexPosition
@export var player_spawn_positions: Array[HexPosition]
@export var enemy_mothership_position: HexPosition
@export var enemy_spawn_positions: Array[HexPosition]
@export var planet_positions: Array[HexPosition]


func _init(r: int = 0, c: int = 0, pmp: HexPosition = HexPosition.new(0,0), psp: Array[HexPosition] = [], emp: HexPosition = HexPosition.new(0,0), esp: Array[HexPosition] = [], pp: Array[HexPosition] = []) -> void:
	rows = r
	columns = c
	player_mothership_position = pmp
	player_spawn_positions = psp
	enemy_mothership_position = emp
	enemy_spawn_positions = esp
	planet_positions = pp
