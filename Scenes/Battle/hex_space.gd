class_name HexSpace
extends Control

@export var hex_position: HexPosition


func resize(new_size):
	for child in get_children():
		child.scale = new_size / size
	$Hexagon.position.x *= new_size.x / size.x
	size = new_size
