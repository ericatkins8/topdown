extends Node2D

func _process(delta):
	$Camera2D.set_position($KinematicBody2D.get_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
