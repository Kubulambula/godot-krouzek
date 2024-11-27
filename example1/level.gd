extends Node2D


func _ready() -> void:
	spawn_box()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		spawn_real_ball()


func spawn_real_ball():
	var ball = load("res://ball.tscn").instantiate()
	add_child(ball)


func spawn_box():
	var rigidbody = RigidBody2D.new()
	add_child(rigidbody)
	var collision_shape = CollisionShape2D.new()
	rigidbody.add_child(collision_shape)
	var shape = RectangleShape2D.new()
	collision_shape.shape = shape
	shape.size = Vector2(64, 64)
	
	var sprite = Sprite2D.new()
	sprite.texture = load("res://assets/icon.svg")
	sprite.scale.x = 0.5
	sprite.scale.y = 0.5
	rigidbody.add_child(sprite)
