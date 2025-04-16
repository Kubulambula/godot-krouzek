extends CharacterBody2D


var step_sounds = [
	load("res://assets/step_1.wav"),
	load("res://assets/step_2.wav"),
	load("res://assets/step_3.wav"),
	load("res://assets/step_4.wav"),
]

var current_character = "darwin"
@onready var characters = {
	"darwin": $Darwin,
	"karel": $Karel,
	"syd": $Syd
}


var gravity = Vector2(0, 500)
#Vector2(0, -500)

var hp = 100


func jump_pad_bounce():
	characters[current_character].bounce()


func switch_to_character(character_to_change_to):
	if current_character == "syd" and character_to_change_to != "syd":
		if gravity.y < 0:
			characters["syd"].ability()
	current_character = character_to_change_to

func switch_characters():
	if Input.is_action_just_pressed("character1"):
		switch_to_character("darwin")
	elif Input.is_action_just_pressed("character2"):
		switch_to_character("syd")
	elif Input.is_action_just_pressed("character3"):
		switch_to_character("karel")
	elif Input.is_action_just_pressed("character4"):
		print("character 4")


func _physics_process(delta: float) -> void:
	switch_characters()
	
	UI.ui_scene.set_hp(hp)
	# Add the gravity.
	#if not is_on_floor():
	velocity += gravity * delta
	
	if Input.is_action_just_pressed("take_damage"):
		hp = hp - 10
	
	if Input.is_action_just_pressed("ability"):
		characters[current_character].ability()
	
	# Handle jump
	if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_ceiling()):
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
		characters[current_character].run(direction)
		characters[current_character].run_animation()
	else:
		#$AnimatedSprite2D.play("idle")
		velocity.x = 0
		characters[current_character].idle_animation()
	
	move_and_slide()


func play_random_sound(array):
	randomize()
	var random_number = randi_range(0, array.size() - 1)
	$AudioStreamPlayer2D.stream = array[random_number]
	$AudioStreamPlayer2D.play()
