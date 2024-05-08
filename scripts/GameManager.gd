extends Node

@onready var tile_map = $"../TileMap"
@onready var total_coins := get_tree().get_nodes_in_group("coins")

var score := 0

func add_point():
	score += 1
