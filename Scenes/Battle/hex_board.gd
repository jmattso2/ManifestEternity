extends Control

@export var battlefield: Battlefield

const hex_base := preload("res://Scenes/Battle/hex_space.tscn")
const ship_base := preload("res://Scenes/Battle/ship.tscn")
const mothership_base := preload("res://Scenes/Battle/mothership.tscn")

@onready var hex_size := Vector2(size.x / (1.5 * battlefield.columns + 0.25), size.y / (0.5 * battlefield.rows + 0.5))
const ship_ratio := 0.6
const mothership_ratio := 0.7

@onready var hexes: Node = $Hexes
@onready var player_ships: Node = $PlayerShips
@onready var enemy_ships: Node = $EnemyShips



func get_hex_coordinates(r, c, center = false):
	var val = position + Vector2(hex_size.x * (1.5 * c + 0.75 * (int(r) % 2)), hex_size.y * 0.5 * r)
	if center:
		return val + hex_size / 2
	return val


func _ready():
	for r in battlefield.rows:
		for c in battlefield.columns:
			var new_hex: HexSpace = hex_base.instantiate()
			new_hex.resize(hex_size)
			new_hex.position = get_hex_coordinates(r, c)
			new_hex.z_index = -2
			new_hex.hex_position = HexPosition.new(r, c)
			hexes.add_child(new_hex)
	
	var player_mothership: Mothership = mothership_base.instantiate()
	player_mothership.resize(hex_size * mothership_ratio)
	player_mothership.position = get_hex_coordinates(battlefield.player_mothership_position.row, \
													 battlefield.player_mothership_position.col, \
													 true)
	player_mothership.hex_position = HexPosition.new(battlefield.player_mothership_position.row, \
													 battlefield.player_mothership_position.col)
	player_ships.add_child(player_mothership)
	
	var enemy_mothership: Mothership = mothership_base.instantiate()
	enemy_mothership.resize(hex_size * mothership_ratio)
	enemy_mothership.position = get_hex_coordinates(battlefield.enemy_mothership_position.row, \
													 battlefield.enemy_mothership_position.col, \
													 true)
	enemy_mothership.hex_position = HexPosition.new(battlefield.enemy_mothership_position.row, \
													 battlefield.enemy_mothership_position.col)
	enemy_ships.add_child(enemy_mothership)
	
	for spawn_position: HexPosition in battlefield.player_spawn_positions:
		if !spawn_position.compare_to(battlefield.player_mothership_position):
			var new_ship: Ship = ship_base.instantiate()
			new_ship.resize(hex_size * ship_ratio)
			new_ship.position = get_hex_coordinates(spawn_position.row, spawn_position.col, true)
			new_ship.hex_position = spawn_position
			player_ships.add_child(new_ship)
	
	for spawn_position: HexPosition in battlefield.enemy_spawn_positions:
		if !spawn_position.compare_to(battlefield.enemy_mothership_position):
			var new_ship: Ship = ship_base.instantiate()
			new_ship.resize(hex_size * ship_ratio)
			new_ship.position = get_hex_coordinates(spawn_position.row, spawn_position.col, true)
			new_ship.hex_position = spawn_position
			enemy_ships.add_child(new_ship)
