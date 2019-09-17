extends Node2D

var Initialized = false
const MAP_SIZE = Vector2(12*128, 14*64)
var foods = ["apple", "baguettes", "bananas", "beer", "blue_fish", "bottle", "bread", "burger", "burrito", "cake", "card", "cash", "cheese", "chicken", "chocolate", "cocos", "coctail", "coffee", "cupcake", "dolar", "donut", "eggs", "fish", "french_toasts", "grapes", "icecream", "kebab", "kettle", "kiwi", "lemon", "mango", "melon", "octopus", "olives", "orange", "peach", "pear", "pineapple", "pizza", "salad", "soda", "soup", "square_bread", "starfish", "steak", "sushi", "syrup", "tapas", "waffle", "wallet", "watermelon", "wine"]
func _process(delta):
	if not Initialized:
		spawn_items()
		Initialized = true

func spawn_items():
	for foodName in foods:
		var imagetexture = ImageTexture.new()
		imagetexture = ResourceLoader.load("res://assets/food/" + foodName + ".png")
		var item = ResourceLoader.load("res://pickable objects/item.tscn").instance()
		item.set_image(imagetexture)
		set_item_position(item)
		get_parent().add_child(item)

func set_item_position(item):
	var x = rand_range(0, MAP_SIZE.x)
	var y = rand_range(0, MAP_SIZE.y)
	item.position = Vector2(x, y)
	