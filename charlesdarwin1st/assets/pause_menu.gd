extends CanvasLayer


func pause():
	get_tree().paused = true
	visible = true


func unpause():
	get_tree().paused = false
	visible = false


func exit():
	get_tree().quit()
