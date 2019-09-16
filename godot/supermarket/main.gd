extends Node2D

var Initialized = false
const MAP_SIZE = Vector2(12*128, 14*64)
 
func _process(delta):
	if not Initialized:
		spawn_items()
		Initialized = true

func spawn_items():
	var dir = Directory.new()
	dir.change_dir("./assets/food/")
	dir.list_dir_begin(true, true)
	var file = dir.get_next()
	while(file != ""):
		if (".import" in file):
			file = dir.get_next()
			continue
		var imagetexture = ImageTexture.new()
		imagetexture.load("./assets/food/" + file)
		var item = preload("res://pickable objects/item.tscn").instance()
		item.set_image(imagetexture)
		set_item_position(item)
		get_parent().add_child(item)
		file = dir.get_next()

func set_item_position(item):
	var x = rand_range(0, MAP_SIZE.x)
	var y = rand_range(0, MAP_SIZE.y)
	item.position = Vector2(x, y)
	