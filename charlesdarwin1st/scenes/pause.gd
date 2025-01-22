extends Node


var pause_scene


func _ready() -> void:
	pause_scene = load("res://assets/pause_menu.tscn").instantiate()
	add_child(pause_scene)
	pause_scene.unpause()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_scene.pause()
