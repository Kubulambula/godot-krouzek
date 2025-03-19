extends Node2D


func ability():
	print("nic neumim")

func jump():
	get_parent().velocity = -300 * get_parent().gravity.normalized()

func bounce():
	get_parent().velocity = -300 * get_parent().gravity.normalized()

func run(direction):
	get_parent().velocity.x = direction * 300

func run_animation():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_darwin")

func idle_animation():
	$"../AnimatedSprite2D".play("idle_darwin")
