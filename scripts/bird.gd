extends Node2D
## This is a class for the bird enemy in the game

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animated_sprite = $AnimatedSprite2D

enum move_type {RAYCAST, ANIMATION}
@export var movement_type : move_type
@export var SPEED := 60
@export_enum("Right:1", "Left:-1") var direction : int = 1 ## This lets the direction variable be set in the inspector to start moving either left or right per instance of the scene.

func _ready():
	# If we want to start the movement towards the left instead of towards the right this flips the sprite.
	# Otherwise it does nothing.
	if direction == -1:
		animated_sprite.flip_h = true

func _physics_process(delta):
	if movement_type == move_type.RAYCAST:		# The if statement is preparation for multiple types of movement.
		if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
			direction *= -1 					# Multiply by -1 swaps the value between positive and negative
			animated_sprite.flip_h = !animated_sprite.flip_h
		
	position.x += direction * SPEED * delta
