extends Node2D


func ability():
	print("nic neumim")

func jump():
	if get_parent().is_on_floor():
		get_parent().velocity = -300 * get_parent().gravity.normalized()

func climb_up():
	pass

func climb_down():
	pass

func bounce():
	get_parent().velocity = -300 * get_parent().gravity.normalized()

func gravity():
	get_parent().velocity += get_parent().gravity

func run(direction):
	get_parent().velocity.x = direction * 300

func run_animation():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_darwin")

func idle_animation():
	$"../AnimatedSprite2D".play("idle_darwin")
