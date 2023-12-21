class_name HexPosition
extends Resource

@export var row: int
@export var col: int


func _init(r: int = 0, c: int = 0) -> void:
	row = r
	col = c


func compare_to(other: HexPosition) -> bool:
	return row == other.row and col == other.col
