extends "res://pickable objects/pickableObjects.gd"

func _init():
	name = "item"
	
func set_image(image_texture):
	get_child(1).set_texture(image_texture)
	