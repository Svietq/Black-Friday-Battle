extends StaticBody2D

var picked = false
var items = 0

func _init():
	name = "item"

func _physics_process(delta):
	var name   = $CollisionShape2D.get_parent().get_name()
	var bodies = $detector.get_overlapping_bodies()

	if picked == true:
		pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var bodies = $detector.get_overlapping_bodies()
		for b in bodies:
			if b.name == "player" and picked == false:
				picked = true
	if Input.is_action_just_released("ui_accept"):
		picked = false
		var bodies = $detector.get_overlapping_areas()
		for b in bodies:
			if name == "Trolley":
				print("polozone na wozku")
				print(b.name)
				items+=1
		
func is_overlapping():
	return $detector.get_overlapping_areas().size() > 0

func set_image(image_texture):
	get_child(1).set_texture(image_texture)
		
