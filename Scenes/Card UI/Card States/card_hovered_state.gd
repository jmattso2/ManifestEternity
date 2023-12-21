extends CardState

const tween_time: float = 0.1
const scale_multiplier: float = 1.1
var orig_size := Vector2.ZERO
var orig_position := Vector2.ZERO
var target_position := Vector2.ZERO

var t: float = 0
var active := false


func enter() -> void:
	#card_ui.color_rect.color = Color.YELLOW
	card_ui.state_label.text = "Hovered"
	
	orig_position = card_ui.global_position
	orig_size = card_ui.size
	target_position = orig_position + ((1 - scale_multiplier) * orig_size) / 2
	t = 0
	active = true


func _process(delta) -> void:
	if active:
		if t < 1:
			card_ui.global_position = orig_position.lerp(target_position, t)
			card_ui.size = orig_size * (1 - t) + orig_size * scale_multiplier * t
			t += delta / float(tween_time)
		else:
			card_ui.global_position = target_position
			card_ui.size = orig_size * scale_multiplier
			active = false


func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		transition_requested.emit(self, CardState.State.CLICKED)


func on_mouse_exited() -> void:
	transition_requested.emit(self, CardState.State.BASE)


func exit() -> void:
	card_ui.global_position = orig_position
	card_ui.size = orig_size
	active = false
