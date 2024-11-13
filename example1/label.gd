extends Label

var x = 0



func _process(delta: float) -> void:
	var y = 1
	x = x + delta
	
	
	text = str(x)
	
