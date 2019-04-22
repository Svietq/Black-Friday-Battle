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
		velocity = cartesian_to_isometric(velocity)
		velocity = velocity.normalized() * speed

func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)
