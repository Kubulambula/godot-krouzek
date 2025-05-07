extends Node2D


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
	print(get_parent().is_on_wall())
	if not get_parent().is_on_wall():
		get_parent().velocity += get_parent().gravity

func run(direction):
	get_parent().velocity.x = direction * 300

func run_animation():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_medarda")

func idle_animation():
	$"../AnimatedSprite2D".play("idle_medarda")
