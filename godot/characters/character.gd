extends KinematicBody2D


export (int) var speed
var velocity = Vector2()
var can_pick = true
var items_counter = 0

func control(delta):
	pass

func _physics_process(delta):
	control(delta)
	var collisionData = move_and_collide(velocity * delta)
	if collisionData and collisionData.collider is preload("res://pickable objects/pickableObjects.gd"):
		collisionData.collider.queue_free()
		items_counter += 1
		get_node("GUI/Label").set_text(str(items_counter))
	