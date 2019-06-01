extends RigidBody2D

var picked = false
var items = 0


func _physics_process(delta):
	var name   = $CollisionShape2D.get_parent().get_name()
	var bodies = $detector.get_overlapping_bodies()

	if picked == true:
		print("ziemniak2", get_parent())
		self.position = get_node("../player/Position2D").get_transform().get_origin()
		self.rotation = get_node("../player/Position2D").get_transform().get_rotation()

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var bodies = $detector.get_overlapping_bodies()
		for b in bodies:
			if b.name == "player" and picked == false:
				picked = true
				get_node("../player").can_pick = false
	if Input.is_action_just_released("ui_accept"):
		picked = false
		var bodies = $detector.get_overlapping_areas()
		for b in bodies:
			if name == "Trolley":
				print("polozone na wozku")
				print(b.name)
				items+=1
	
		print("ziemniak", get_parent())

		get_node("../player").can_pick = true
		
