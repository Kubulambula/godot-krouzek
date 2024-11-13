extends Area2D

var is_inside = false

func _on_body_entered(body: Node2D) -> void:
	is_inside = true
	#print("entered")

func _on_body_exited(body: Node2D) -> void:
	is_inside = false
	#print("exited")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if is_inside == true:
			print("hit!")
