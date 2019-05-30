extends RigidBody2D

var picked = false

func _physics_process(delta):
	if picked == true:
		self.position = get_node("../player/Position2D").get_transform().get_origin()
		sleeping = true
	else:
		sleeping = false
	

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var bodies = $detector.get_overlapping_bodies()
		for b in bodies:
			if b.name == "player" and picked == false:
				picked = true
				get_node("../player").can_pick = false
	if Input.is_action_just_released("ui_accept"):
		picked = false
		get_node("../player").can_pick = true
