extends Node

@onready var level_music = 	{
	1 : $AudioStreamPlayerLevel1,
	2 : $AudioStreamPlayerLevel2
}
@onready var level_scenes = {
	1 : "res://scenes/level_1.tscn",
	2 : "res://scenes/level_2.tscn"
}

var initial_lives := 6
var lives := initial_lives
var score := 0
var current_level := 1 # Keep on 1 for release, change if testing.
var player

func add_point():
	score += 1

func start_music(level : int):
	level_music[level].autoplay = true
	level_music[level].play()

func end_music(level : int):
	level_music[level].autoplay = false
	level_music[level].stop()

func next_level():
	end_music(current_level)
	current_level += 1
	get_tree().change_scene_to_file(level_scenes[current_level])
	start_music(current_level)

# Die
# level 2 double jump chekcpoint: x-51 y -496
func die():
	lives -= 1
	if lives == 0:
		restart()
	elif current_level == 2 and player.upgraded_double_jumps == 1:
		player.position.x = -56
		player.position.y = -496
	else:
		get_tree().reload_current_scene()

# Restart
func restart():
	score = 0
	lives = initial_lives
	end_music(current_level)
	current_level = 1
	get_tree().change_scene_to_file(level_scenes[current_level])
	start_music(current_level)
