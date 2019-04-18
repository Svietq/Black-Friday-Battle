extends "res://characters/character.gd"

const Y_AXIS_ROTATION = deg2rad(63.5)
const X_AXIS_ROTATION = deg2rad(26.5)

func control(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed('ui_up'):
		velocity += Vector2(0, -1).rotated(Y_AXIS_ROTATION)
			
	if Input.is_action_pressed('ui_down'):
		velocity += Vector2(0, 1).rotated(Y_AXIS_ROTATION)
			
	if Input.is_action_pressed('ui_left'):
		velocity += Vector2(-1, 0).rotated(X_AXIS_ROTATION)
			
	if Input.is_action_pressed('ui_right'):
		velocity += Vector2(1, 0).rotated(X_AXIS_ROTATION)
		
	if velocity != Vector2():
		set_rotation(velocity.angle())
		velocity = velocity.normalized() * speed