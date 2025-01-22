extends CanvasLayer


func pause():
	get_tree().paused = true
	visible = true


func unpause():
	get_tree().paused = false
	visible = false


func exit():
	get_tree().quit()


func _on_continue_button_pressed() -> void:
	unpause()


func _on_exit_button_pressed() -> void:
	exit()
