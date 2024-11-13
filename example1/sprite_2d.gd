extends Sprite2D


var time = 0

var a = Vector2(200, 100)
var b = Vector2(50, 100)
var c = Vector2(200, 100) * 3
var 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(x)
	time = time + delta * 10
	
	position.x = position.x - sin(time) * 5
	position.y = position.y + sin(time) * 5
	
	if Input.is_action_just_pressed("ui_accept"):
		print(position)
		var okno = get_tree()
		
		okno.paused = false




var z = 1.0
