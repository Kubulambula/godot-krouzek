extends Node2D


func jump():
	get_parent().velocity = -200 * get_parent().gravity.normalized()

func run():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_darwin")

func idle():
	$"../AnimatedSprite2D".play("idle_darwin")
