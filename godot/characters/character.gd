extends KinematicBody2D


export (int) var speed
var velocity = Vector2()
var can_pick = true

func control(delta):
	pass

func _physics_process(delta):
	control(delta)
	var collisionData = move_and_collide(velocity * delta)
	if collisionData and collisionData.collider is preload("res://pickable objects/pickableObjects.gd"):
		collisionData.collider.queue_free()
	