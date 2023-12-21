extends CardState

var played: bool


func enter() -> void:
	#card_ui.color_rect.color = Color.DARK_VIOLET
	card_ui.state_label.text = "Released"
	
	played = false
	
	if not card_ui.targets.is_empty():
		played = true
		print_debug("play card to target(s) ", card_ui.targets)


func on_input(event: InputEvent) -> void:
	if played:
		return
	
	transition_requested.emit(self, CardState.State.BASE)
