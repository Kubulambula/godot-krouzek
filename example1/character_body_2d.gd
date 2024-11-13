extends CharacterBody2D

var speed = 400

func _physics_process(delta: float) -> void:
	var direction = Vector2(0, 0)
	if Input.is_action_pressed("right"):
		direction.x = 1
		$AnimatedSprite2D.play("right")
	if Input.is_action_pressed("left"):
		direction.x = -1
		$AnimatedSprite2D.play("left")
	if Input.is_action_pressed("down"):
		direction.y = 1
		$AnimatedSprite2D.play("down")
	if Input.is_action_pressed("up"):
		direction.y = -1
		$AnimatedSprite2D.play("up")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_released("left"):
		$AnimatedSprite2D.play("left idle")
	if Input.is_action_just_released("right"):
		$AnimatedSprite2D.play("right idle")
	if Input.is_action_just_released("up"):
		$AnimatedSprite2D.play("up idle")
	if Input.is_action_just_released("down"):
		$AnimatedSprite2D.play("down idle")
	
