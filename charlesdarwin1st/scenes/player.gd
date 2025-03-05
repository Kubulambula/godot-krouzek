extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -200.0

var step_sounds = [
	load("res://assets/step_1.wav"),
	load("res://assets/step_2.wav"),
	load("res://assets/step_3.wav"),
	load("res://assets/step_4.wav"),
]

var current_character = "karel"
@onready var characters = {
	"darwin": $Darwin,
	"karel": $Karel,
	"syd": $Syd
}

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
		gravity = -gravity
		$AnimatedSprite2D.flip_v = not $AnimatedSprite2D.flip_v

	# Handle jump
	if Input.is_action_just_pressed("ui_up") and (is_on_floor() or is_on_ceiling()):
		characters[current_character].jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if $Timer.is_stopped():
			$Timer.wait_time = 0.2
			$Timer.start()
			play_random_sound(step_sounds)
		#$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
		characters[current_character].run()
	else:
		#$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		characters[current_character].idle()
	
	move_and_slide()


func play_random_sound(array):
	randomize()
	var random_number = randi_range(0, array.size() - 1)
	$AudioStreamPlayer2D.stream = array[random_number]
	$AudioStreamPlayer2D.play()
