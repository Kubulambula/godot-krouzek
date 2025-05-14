class_name Bob
extends RigidBody2D

var torgue_force = 5000
var jump_force = 300

enum Direction {
	STOP,
	LEFT,
	RIGHT,
	JUMP,
}

func _ready() -> void:
	roll_right()
	#jump()

func jump():
	apply_central_impulse(Vector2.UP * jump_force)

func roll_left():
	constant_torque = -torgue_force

func roll_right():
	constant_torque = torgue_force

func roll_stop():
	constant_torque = 0

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.roll_direction == Direction.LEFT:
		roll_left()
	elif area.roll_direction == Direction.RIGHT:
		roll_right()
	elif area.roll_direction == Direction.STOP:
		roll_stop()
	elif area.roll_direction == Direction.JUMP:
		jump()


func _on_player_area_body_entered(player: Node2D) -> void:
	if player.current_character == "karel":
		if player.global_position.y < global_position.y:
			print("Bob dead")
			queue_free()
			return
	print("player dead")
	get_tree().reload_current_scene()
