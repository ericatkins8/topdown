extends KinematicBody2D

var speed = 200  # speed in pixels/sec
var velocity = Vector2(0,0)
var friction = .35
var maxspeed = 300
var acceleration = maxspeed * (1 - friction)


func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		velocity.x += acceleration
	if Input.is_action_pressed('ui_left'):
		velocity.x -= acceleration
	if Input.is_action_pressed('ui_down'):
		velocity.y += acceleration
	if Input.is_action_pressed('ui_up'):
		velocity.y -= acceleration
	
	velocity = velocity.normalized() * acceleration

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

