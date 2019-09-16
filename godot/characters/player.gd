extends "res://characters/character.gd"

var ms = 0
var s = 15
var m = 0
var is_time_over = false

func _init():
	name = "Player"

func control(delta):
	if is_time_over:
		velocity = Vector2(0,0)
		return
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
		velocity = velocity.normalized() * speed
		get_node("Position2D").position = get_node("Position2D").position.linear_interpolate(position + velocity, 1.0)
		get_node("Position2D").rotation = transform.get_rotation()

func _on_Timer_timeout():
	if not is_time_over:
		ms -= 1

func _process(delta):
	if ms < 0:
		if m <= 0 and s <= 0:
			get_parent().get_node("CanvasLayer/GUI/HBoxContainer/Timer").set_text(" Time over")
			is_time_over = true
			return
		ms = 9
		s -= 1
	
	if s < 0:
		s = 59
		m -= 1
		
	if m < 0:
		m = 0
		
	get_parent().get_node("CanvasLayer/GUI/HBoxContainer/Timer").set_text(" Time left: " + str(m)+":"+str(s)+":"+str(ms))
