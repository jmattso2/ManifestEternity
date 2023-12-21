class_name CardUI
extends Control

signal reparent_requested(card: CardUI)

@export var card_data: Card

@onready var card_image: TextureRect = $CardImage
@onready var state_label: Label = $State
@onready var cost_label: Label = $VBoxContainer/HBoxContainer/CostLabel
@onready var quantity_label: Label = $VBoxContainer/HBoxContainer/QuantityLabel
@onready var drop_detector: Area2D = $DropDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
@onready var targets: Array[Node] = []


func _ready() -> void:
	card_image.texture = card_data.image
	cost_label.text = str(card_data.cost)
	if card_data.quantity == 0:
		quantity_label.visible = false
	else:
		quantity_label.text = str(card_data.quantity)
	card_state_machine.init(self)


func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)


func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()


func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()


func _on_drop_detector_area_entered(area):
	if not targets.has(area):
		targets.append(area)


func _on_drop_detector_area_exited(area):
	targets.erase(area)
