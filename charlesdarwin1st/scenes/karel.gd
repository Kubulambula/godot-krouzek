extends Node2D


func jump():
	print("jsem linej")

func run():
	# get_parent() = $".."
	$"../AnimatedSprite2D".play("run_karel")

func idle():
	$"../AnimatedSprite2D".play("idle_karel")
