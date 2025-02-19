extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.jump_pad_bounce()
	$StaticBody2D/AnimatedSprite2D.play("bounce")
	$AudioStreamPlayer2D.play()


func _on_animated_sprite_2d_animation_finished() -> void:
	$StaticBody2D/AnimatedSprite2D.play("idle")
