extends Node2D


func _ready() -> void:
	var config = ConfigFile.new()
	config.load("user://pepa.txt")
	$HSlider.value = config.get_value("Audio", "MasterVolume", 0.5)
	$HSlider2.value = config.get_value("Audio", "MusicVolume", 0.5)
	$HSlider3.value = config.get_value("Audio", "SFXVolume", 0.5)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test_level.tscn")


func set_volume(bus_name, value_from_0_to_1):
	var volume_in_db = linear_to_db(value_from_0_to_1)
	var bus_index = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, volume_in_db)


func _on_h_slider_value_changed(value: float) -> void:
	set_volume("Master", value)

func _on_h_slider_2_value_changed(value: float) -> void:
	set_volume("Music", value)

func _on_h_slider_3_value_changed(value: float) -> void:
	set_volume("SFX", value)


func _on_exit_button_pressed() -> void:
	var config = ConfigFile.new()
	config.set_value("Audio", "MasterVolume", $HSlider.value)
	config.set_value("Audio", "MusicVolume", $HSlider2.value)
	config.set_value("Audio", "SFXVolume", $HSlider3.value)
	config.save("user://pepa.txt")
	
	get_tree().quit()
