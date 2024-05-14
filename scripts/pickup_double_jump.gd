extends Area2D
@onready var pickup_sound = $PickupSound
@onready var animation_player = $AnimationPlayer
@onready var upgrade_point_light = %UpgradePointLight

func _on_body_entered(body):
	if body.has_method("upgrade_jumps"):
		body.upgrade_jumps()
		upgrade_point_light.queue_free()
		animation_player.play("pickup")
	
