extends Node2D


func jump():
	get_parent().velocity = -500 * get_parent().gravity.normalized()

func run():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_syd")

func idle():
	$"../AnimatedSprite2D".play("idle_syd")
