extends KinematicBody2D


export (int) var speed
var velocity = Vector2()
var can_pick = true

func control(delta):
	pass

func _physics_process(delta):
	control(delta)
	move_and_slide(velocity)
	


