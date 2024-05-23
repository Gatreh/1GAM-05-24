extends Node2D


func _ready():
	GameManager.start_music(2)
	GameManager.player = $Player
