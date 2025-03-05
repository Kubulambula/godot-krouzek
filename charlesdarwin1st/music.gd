extends Node


var music_player

func _ready() -> void:
	music_player = AudioStreamPlayer.new()
	music_player.bus = "Music"
	music_player.stream = load("res://assets/Fun Background.mp3")
	add_child(music_player)
	#music_player.play()
	
	
#	linear_to_db()
#	db_to_linear()
