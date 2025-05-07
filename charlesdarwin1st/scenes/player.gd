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
	"syd": $Syd,
	"borivoj": $Borivoj,
	"medarda": $Medarda
}


var gravity = Vector2(0, 10)
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
		switch_to_character("borivoj")
	elif Input.is_action_just_pressed("character5"):
		switch_to_character("medarda")


func _physics_process(_delta: float) -> void:
	switch_characters()
	
	UI.ui_scene.set_hp(hp)
	# Add the gravity.
	characters[current_character].gravity()
	
	if Input.is_action_just_pressed("take_damage"):
		hp = hp - 10
	
	if Input.is_action_just_pressed("ability"):
		characters[current_character].ability()
	
	# Handle jump
	if Input.is_action_just_pressed("jump"):
		characters[current_character].jump()
	
	if Input.is_action_pressed("climb_up"):
		characters[current_character].climb_up()
	elif Input.is_action_pressed("climb_down"):
		characters[current_character].climb_down()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("walk_left", "walk_right")
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
