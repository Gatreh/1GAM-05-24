extends Area2D

@onready var death_timer = $DeathTimer

func _on_body_entered(body):
	Engine.time_scale = 0.1
	# body.get_node("CollisionShape2D").queue_free()
	# body.set_collision_mask_value(1, false)
	death_timer.start()
	
func _on_death_timer_timeout():
	get_tree().reload_current_scene()
	Engine.time_scale = 1.0
