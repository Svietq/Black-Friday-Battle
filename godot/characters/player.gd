extends "res://characters/character.gd"

var ms = 0
var s = 15
var m = 0
var is_time_over = false

var up_right_image = ImageTexture.new()
var down_right_image = ImageTexture.new()
var up_left_image = ImageTexture.new()
var down_left_image = ImageTexture.new()

func _init():
	name = "Player"
	
	var dir = Directory.new()
	dir.change_dir("./assets/characters/")
	dir.list_dir_begin(true, true)
	up_right_image.load("./assets/characters/trolley_up_right.png")
	down_right_image.load("./assets/characters/trolley_down_right.png")
	up_left_image.load("./assets/characters/trolley_up_left.png")
	down_left_image.load("./assets/characters/trolley_down_left.png")
	
func control(delta):
	if is_time_over:
		velocity = Vector2(0,0)
		return
	velocity = Vector2()
	
	if Input.is_action_pressed('ui_up'):
		get_node("Sprite").set_texture(up_right_image)
		velocity += Vector2(0, -1)

	if Input.is_action_pressed('ui_down'):
		get_node("Sprite").set_texture(down_left_image)
		velocity += Vector2(0, 1)

	if Input.is_action_pressed('ui_left'):
		get_node("Sprite").set_texture(up_left_image)
		velocity += Vector2(-1, 0)

	if Input.is_action_pressed('ui_right'):
		get_node("Sprite").set_texture(down_right_image)
		velocity += Vector2(1, 0)
	
	if velocity != Vector2():
		velocity = cartesian_to_isometric(velocity)
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

func cartesian_to_isometric(cartesian):
       return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)

