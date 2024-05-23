extends Node2D

@onready var tile_map = $TileMap
@onready var total_coins := get_tree().get_nodes_in_group("coins")

func _ready():
	GameManager.start_music(1)
	GameManager.player = $Player

func _on_next_level_door_body_entered(body):
	if %NextLevelDoor.allow_open:
		await get_tree().create_timer(1.0).timeout
		GameManager.next_level()
