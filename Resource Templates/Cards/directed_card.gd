class_name DirectedCard
extends Card

enum Direction {FORWARD_LEFT, FORWARD, FORWARD_RIGHT, BACKWARD_RIGHT, BACKWARD, BACKWARD_LEFT, NONE}

@export_group("Card Attributes")
@export var direction_1: Direction
@export var direction_2: Direction
