extends Node

@onready var level_music = 	{
	1 : $AudioStreamPlayerLevel1,
	2 : $AudioStreamPlayerLevel2
}
@onready var level_scenes = {
	1 : "res://scenes/level_1.tscn",
	2 : "res://scenes/level_2.tscn"
}

var score := 0

func start_music(level : int):
	level_music[level].autoplay = true
	level_music[level].play()

func end_music(level : int):
	level_music[level].autoplay = false
	level_music[level].stop()

func add_point():
	score += 1

func next_level(level : int):
	end_music(level - 1)
	get_tree().change_scene_to_file(level_scenes[level])
	start_music(2)
