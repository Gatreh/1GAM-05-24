extends Area2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D

func _on_body_exited(body):
	collision_shape_2d.queue_free()
	animated_sprite_2d.play("close")

