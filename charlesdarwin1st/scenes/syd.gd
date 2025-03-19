extends Node2D


func ability():
	get_parent().gravity = -get_parent().gravity
	$"../AnimatedSprite2D".flip_v = not $"../AnimatedSprite2D".flip_v


func jump():
	get_parent().velocity = -200 * get_parent().gravity.normalized()

func bounce():
	get_parent().velocity = -350 * get_parent().gravity.normalized()

func run(direction):
	get_parent().velocity.x = direction * 500

func run_animation():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_syd")

func idle_animation():
	$"../AnimatedSprite2D".play("idle_syd")
