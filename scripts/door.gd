extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D


func _on_body_entered(body):
	animated_sprite_2d.play("open")
	print("body entered")


func _on_body_exited(body):
	animated_sprite_2d.play("close")
	print("body exited")
