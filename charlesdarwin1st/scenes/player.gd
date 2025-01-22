extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -200.0

var gravity = Vector2(0, 500)

var hp = 100


func jump_pad_bounce():
	velocity = JUMP_VELOCITY * gravity.normalized()


func _physics_process(delta: float) -> void:
	UI.ui_scene.set_hp(hp)
	# Add the gravity.
	#if not is_on_floor():
	velocity += gravity * delta
	
	if Input.is_action_just_pressed("take_damage"):
		hp = hp - 10
	
	if Input.is_action_just_pressed("flip_gravity"):
		gravity= -gravity
		$AnimatedSprite2D.flip_v = not $AnimatedSprite2D.flip_v

	# Handle jump
	if Input.is_action_just_pressed("ui_up") and (is_on_floor() or is_on_ceiling()):
		velocity=JUMP_VELOCITY * gravity.normalized()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
