extends Node

var cheat_code = ["C", "H", "I", "C", "K", "E", "N"]
var player_code = []

var sound = AudioStreamPlayer.new()

func _ready() -> void:
	sound.stream = preload("res://assets/chicken-jockey_yOuMF2O.mp3")
	add_child(sound)


func are_codes_equal():
	for i in player_code.size():
		if cheat_code[i] != player_code[i]:
			player_code = player_code.slice(-1)
			return false
	
	if cheat_code.size() == player_code.size():
		player_code = player_code.slice(-1)
		return true
	else:
		return false


func _input(event: InputEvent):
	if event is InputEventKey:
		if event.is_pressed() and not event.is_echo():
			player_code.push_back(event.as_text_keycode())
			if are_codes_equal() == true:
				sound.play()
