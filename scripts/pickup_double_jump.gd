extends Area2D
@onready var pickup_sound = $PickupSound
@onready var animation_player = $AnimationPlayer
@onready var player = $"../Player"
@onready var point_light_2d_5 = $"../ExtraLight/PoitnLight2D4Red"

func _on_body_entered(body):
	player.upgraded_double_jumps = 1
	point_light_2d_5.queue_free()
	animation_player.play("pickup")
	
