extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body.current_character == "karel":
		process_mode = ProcessMode.PROCESS_MODE_DISABLED
		visible = false
		$AudioStreamPlayer2D.play()
	else:
		$AnimationPlayer.play("shake")


func _on_audio_stream_player_2d_finished() -> void:
	print("sound finished")
	queue_free()
