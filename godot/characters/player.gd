extends "res://characters/character.gd"

func control(delta):
	velocity = Vector2()
	if Input.is_action_pressed('ui_up'):
		velocity += Vector2(0, -speed)
	if Input.is_action_pressed('ui_down'):
		velocity += Vector2(0, speed)
	if Input.is_action_pressed('ui_left'):
		velocity += Vector2(-speed, 0)
	if Input.is_action_pressed('ui_right'):
		velocity += Vector2(speed, 0)
