extends Node2D


var jump_count = 0


func ability():
	print("nic neumim")

func climb_up():
	pass

func climb_down():
	pass

func jump():
	if get_parent().is_on_floor():
		jump_count = 1
		get_parent().velocity = -200 * get_parent().gravity.normalized()
	elif not(get_parent().is_on_floor()) and jump_count < 2:
		jump_count += 1
		get_parent().velocity = -200 * get_parent().gravity.normalized()

func bounce():
	get_parent().velocity = -300 * get_parent().gravity.normalized()

func gravity():
	get_parent().velocity += get_parent().gravity

func run(direction):
	get_parent().velocity.x = direction * 300

func run_animation():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_borivoj")

func idle_animation():
	$"../AnimatedSprite2D".play("idle_borivoj")
