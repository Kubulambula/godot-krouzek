extends CharacterBody2D

var my_scale = 1
var is_jumping = false

func _ready() -> void:
	my_scale = $AnimatedSprite2D.scale.x

func _physics_process(delta: float) -> void:
	var direction = Vector2(0, 0)
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.scale.x = -my_scale
		direction.x = 300
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.scale.x = my_scale
		direction.x = -300
		
	if is_on_floor():
		on_floor()
	else:
		in_air()
		velocity.y = velocity.y + 150 #gravitace
		
	velocity.x = direction.x
	move_and_slide()

func on_floor():
	if $AnimatedSprite2D.animation == "jump_air":
		$AnimatedSprite2D.play("jump_land")
	elif $AnimatedSprite2D.animation == "jump_land":
		return
	elif Input.is_action_just_pressed("jump"):
		velocity.y = -2000
		$AnimatedSprite2D.play("jump_up")
	elif Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")


func in_air():
	$AnimatedSprite2D.play("jump_air")


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "jump_up":
		$AnimatedSprite2D.play("jump_air")
	if $AnimatedSprite2D.animation == "jump_land":
		$AnimatedSprite2D.play("idle")
