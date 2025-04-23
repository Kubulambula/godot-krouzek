extends StaticBody2D

func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body):
	if body.current_character == "karel":
		$AudioStreamPlayer2D.play()
		process_mode = ProcessMode.PROCESS_MODE_DISABLED
		visible = false
	else:
		$AnimationPlayer.play("shake")


func _on_audio_stream_player_2d_finished() -> void:
	print("sound finished")
	queue_free()


func _on_area_2d_body_exited(body: Node2D) -> void:
	$AnimationPlayer.stop()
