extends "res://characters/character.gd"



func control(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed('ui_up'):
		velocity += Vector2(0, -1)

	if Input.is_action_pressed('ui_down'):
		velocity += Vector2(0, 1)

	if Input.is_action_pressed('ui_left'):
		velocity += Vector2(-1, 0)

	if Input.is_action_pressed('ui_right'):
		velocity += Vector2(1, 0)
	

	if velocity != Vector2():
		set_rotation(velocity.angle())
		velocity = velocity.normalized() * speed
		get_node("Position2D").position = get_node("Position2D").position.linear_interpolate(position + velocity, 1.0)
		get_node("Position2D").rotation = transform.get_rotation()
