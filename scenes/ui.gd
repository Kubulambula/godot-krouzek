extends CanvasLayer

var hp_label

func _ready() -> void:
	hp_label = %HPLabel


func set_hp(hp):
	hp_label.text = "HP: " + str(hp)
