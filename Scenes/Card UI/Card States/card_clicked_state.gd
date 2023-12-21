extends CardState


func enter() -> void:
	#card_ui.color_rect.color = Color.ORANGE
	card_ui.state_label.text = "Clicked"
	card_ui.drop_detector.monitoring = true


func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.State.DRAGGING)
