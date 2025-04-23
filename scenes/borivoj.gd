extends Node2D


var can_double_jump = true


func ability():
	print("nic neumim")

func climb_up():
	pass

func climb_down():
	pass

func jump():
	if get_parent().is_on_floor():
		can_double_jump = true
		get_parent().velocity = -200 * get_parent().gravity.normalized()
	elif can_double_jump == true:
		can_double_jump = false
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
