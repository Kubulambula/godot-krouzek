extends CharacterBody2D


func _physics_process(delta: float) -> void:
	var direction = Vector2(0, 0)
	if Input.is_action_pressed("right"):
		direction.x = 300
	if Input.is_action_pressed("left"):
		direction.x = -300
	if Input.is_action_just_pressed("jump"):
		AutoloadABCD.hello()
		if is_on_floor():
			velocity.y = -2000
	
	if not is_on_floor():
		velocity.y = velocity.y + 150 #gravitace
	velocity.x = direction.x
	move_and_slide()
