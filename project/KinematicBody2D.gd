extends KinematicBody2D

var velocity = Vector2(0,0)
var friction = .3
var maxspeed = 150
var acceleration = maxspeed * (1 - friction)


func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		velocity.x += acceleration
		$CollisionShape2D/AnimatedSprite.play("sidewalk")
		$CollisionShape2D/AnimatedSprite.flip_h = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= acceleration
		$CollisionShape2D/AnimatedSprite.play("sidewalk")
		$CollisionShape2D/AnimatedSprite.flip_h = true
	if Input.is_action_pressed('ui_down'):
		$CollisionShape2D/AnimatedSprite.play("walk")
		velocity.y += acceleration
	if Input.is_action_pressed('ui_up'):
		velocity.y -= acceleration
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed('ui_left') or Input.is_action_pressed('ui_down') or Input.is_action_pressed('ui_up'):
		$CollisionShape2D/AnimatedSprite.play()
	else:
		$CollisionShape2D/AnimatedSprite.stop()
	velocity = velocity.normalized() * acceleration

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

