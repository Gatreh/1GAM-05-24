extends Node2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var ray_cast_top = $RayCastTop
@onready var ray_cast_bottom = $RayCastBottom



const SPEED := 60
var direction = 1

func _physics_process(delta):
	if ray_cast_top.is_colliding():
		direction = 1
	
	if ray_cast_bottom.is_colliding():
		direction = -1
		
	position.y += direction * SPEED * delta
