extends Node2D


func ability():
	pass

func jump():
	get_parent().velocity = -100 * get_parent().gravity.normalized()

func bounce():
	get_parent().velocity = -300 * get_parent().gravity.normalized()

func run(direction):
	get_parent().velocity.x = direction * 150

func run_animation():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_karel")

func idle_animation():
	$"../AnimatedSprite2D".play("idle_karel")
