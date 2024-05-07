extends Node

@onready var label = $"../Label"
@onready var tile_map = $"../TileMap"
@onready var total_coins := get_tree().get_nodes_in_group("coins")

var score := 0

func _ready():
	label.text = "You are missing " + str(total_coins.size() - score) + " coins to proceed!"

func add_point():
	score += 1
	if score < total_coins.size():
		label.text = "You are missing " + str(total_coins.size() - score) + " coins to proceed!"
	else:
		label.text = "Congratulations!  You win!"
		tile_map.clear_layer(2)
