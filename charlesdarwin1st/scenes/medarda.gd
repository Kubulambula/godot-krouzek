extends Node2D



func _physics_process(delta: float) -> void:
	if get_parent().current_character != "medarda":
		return
	
	if not get_parent().is_on_wall():
		get_parent().velocity += get_parent().gravity
	else:
		get_parent().velocity.y = 0
	
	if Input.is_action_pressed("climb_up"):
		climb_up()
	elif Input.is_action_pressed("climb_down"):
		climb_down()
	


func ability():
	print("nic neumim")

func jump():
	pass

func climb_up():
	if get_parent().is_on_wall():
		get_parent().velocity.y = -50

func climb_down():
	if get_parent().is_on_wall():
		get_parent().velocity.y = 50

func bounce():
	get_parent().velocity = -300 * get_parent().gravity.normalized()

func gravity():
	pass

func run(direction):
	get_parent().velocity.x = direction * 300

func run_animation():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_medarda")

func idle_animation():
	$"../AnimatedSprite2D".play("idle_medarda")
