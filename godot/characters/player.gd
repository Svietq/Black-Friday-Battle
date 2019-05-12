extends "res://characters/character.gd"



func control(delta):
	velocity = Vector2()
	
	actionPressed = false
	
	if Input.is_action_pressed('ui_up'):
		velocity += Vector2(0, -1)

	if Input.is_action_pressed('ui_down'):
		velocity += Vector2(0, 1)

	if Input.is_action_pressed('ui_left'):
		velocity += Vector2(-1, 0)

	if Input.is_action_pressed('ui_right'):
		velocity += Vector2(1, 0)
		
	if Input.is_action_pressed('ui_select'):
		actionPressed = true

			

	if velocity != Vector2():
		set_rotation(velocity.angle())
		velocity = velocity.normalized() * speed

		if Trolley_handle.position.distance_to(position)<200 && actionPressed && Trolley_handle.isInUse == false:
	#		Trolley_handle.position += velocity.normalized()
			Trolley_handle.position = Trolley_handle.position.linear_interpolate(position + velocity.normalized()*100, 1.0)
			Trolley_handle.rotation = transform.get_rotation()	
			Trolley_handle.isInUse = true


