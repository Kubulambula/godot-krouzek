extends Area2D

@export
var level_to_change = "res://level_2.tscn"


func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file(level_to_change)
