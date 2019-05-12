extends KinematicBody2D


export (int) var speed
var velocity = Vector2()
var actionPressed:bool = false
onready var Trolley_handle = $"../Trolley"

func control(delta):
	pass

func _physics_process(delta):
	Trolley_handle.isInUse = false
	control(delta)
	move_and_slide(velocity)
#	if Trolley_handle.position.distance_to(position)<100 && actionPressed && Trolley_handle.isInUse == false:
##		Trolley_handle.position += velocity.normalized()
#		Trolley_handle.position.linear_interpolate()
#		Trolley_handle.rotation = transform.get_rotation()	
#		Trolley_handle.isInUse = true
#
#
