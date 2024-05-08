extends Area2D
@onready var pickup_sound = $PickupSound
@onready var animation_player = $AnimationPlayer
@onready var player = $"../Player"

func _on_body_entered(body):
	player.upgraded_double_jumps = 1
	animation_player.play("pickup")
	
