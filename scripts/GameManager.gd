extends Node

@onready var tile_map = $"../TileMap"
@onready var total_coins := get_tree().get_nodes_in_group("coins")

var score := 0

func add_point():
	score += 1

func _on_next_level():
	print("works")


func _on_door_body_entered(body):
	if %NextLevelDoor.allow_open:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/tower.tscn")
