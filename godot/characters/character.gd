extends KinematicBody2D
var actionPressed:bool = false
export (int) var speed

var velocity = Vector2()

func control(delta):
	pass

func _physics_process(delta):
	actionPressed = false
	control(delta)
	move_and_slide(velocity)


