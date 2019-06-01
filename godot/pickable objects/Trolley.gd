extends "res://pickable objects/pickableObjects.gd"

onready var countText = get_node("ItemCountText")


func _init():
	name = "Trol"

func _process(delta):
	countText.set_text(str(items))
