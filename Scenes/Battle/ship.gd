class_name Ship
extends Area2D

@export var hex_position: HexPosition

const size: Vector2 = Vector2(128, 128)


func resize(new_size: Vector2):
	var mod_size: Vector2
	if new_size.x > new_size.y:
		mod_size = Vector2(new_size.y, new_size.y)
	else:
		mod_size = Vector2(new_size.x, new_size.x)
	$ShipSprite.scale = mod_size / size
	$Collision.scale = mod_size / size
