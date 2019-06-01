extends RigidBody2D

var picked = false
var items = 0


func _physics_process(delta):
	var name   = $CollisionShape2D.get_parent().get_name()
	var bodies = $detector.get_overlapping_bodies()
	for b in bodies:
			if b.name == "Trolley":
				#print("Trolley")
				print(b.name)
			if b.name == "item1":
				#print("item1")
				print(b.name)
			print(b)
	if picked == true:
		self.position = get_node("../player/Position2D").get_transform().get_origin()
		self.rotation = get_node("../player/Position2D").get_transform().get_rotation()
		

	

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var bodies = $detector.get_overlapping_bodies()
		for b in bodies:
			if b.name == "player" and picked == false:
				picked = true
				get_node("../player").can_pick = false
			if name == "item1":
				print(self.get_colliding_bodies())
				print("item")
			if name == "Trolley":
				print(self.get_colliding_bodies())
				print("Troll")
				items+=1
	if Input.is_action_just_released("ui_accept"):
		picked = false
		var bodies = $detector.get_overlapping_bodies()
		for b in bodies:
			if b.name == "Trolley":
				print("polozone")
		get_node("../player").can_pick = true
