extends Node2D
## This is a class for the bird enemy in the game

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var animated_sprite = $AnimatedSprite2D

enum move_type {RAYCAST, DISTANCE}
@export var movement_type : move_type
@export var distance : int = 0 ## This is only required if the move_type is DISTANCE, otherwise unused.
@export var SPEED := 60
@export_enum("Right:1", "Left:-1") var direction : int = 1 ## This lets the direction variable be set in the inspector to start moving either left or right per instance of the scene.
var initial_direction 
@onready var initial_position = position.x

func _ready():
	# If we want to start the movement towards the left instead of towards the right this flips the sprite.
	# Otherwise it does nothing.
	initial_direction = direction
	if direction == -1:
		animated_sprite.flip_h = true
		distance *= -1

func _physics_process(delta):
	if movement_type == move_type.RAYCAST:		# The if statement is preparation for multiple types of movement.
		if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
			flip_direction()
	
	elif movement_type == move_type.DISTANCE:
		# This is math to check is the mob has travelled further than the distance that it should travel and if it has it'll turn it around.
		# It's a bit long but this is the shortest I could come up with for now.
		if  initial_direction == 1 and (position.x - initial_position > distance or position.x < initial_position):
			flip_direction()
		if  initial_direction == -1 and (position.x - initial_position < distance or position.x > initial_position):
			flip_direction()
	
	position.x += direction * SPEED * delta

func flip_direction():
			direction *= -1 # Multiply by -1 swaps the value between positive and negative
			animated_sprite.flip_h = !animated_sprite.flip_h # Changes to opposite value
