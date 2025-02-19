extends Node
# Autoload
var ui_scene

func _ready() -> void:
	ui_scene = load("res://scenes/ui.tscn").instantiate()
	add_child(ui_scene)
