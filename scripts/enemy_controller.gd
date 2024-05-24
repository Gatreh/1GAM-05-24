extends Node2D
class_name Enemy_Controller
## This is a class for the enemies in the game

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_up = $RayCastUp
@onready var ray_cast_down = $RayCastDown
@onready var animated_sprite = $AnimatedSprite2D

enum move_type {HORIZONTAL_RAYCAST, VERTICAL_RAYCAST, DISTANCE}
@export var movement_type : move_type
@export var distance : int = 0 ## This is only required if the move_type is DISTANCE, otherwise unused.
@export var SPEED := 60 ## This is the speed of the enemy mob in a single direction.
@export_enum("Up:2", "Right:1", "Left:-1", "Down:-2") var direction : int = 1 ## This lets the direction variable be set in the inspector to start moving either left or right per instance of the scene.
var initial_direction ## This stores the initial direction and can be used for logic of how to handle each movement type
@onready var initial_position = position.x ## Used as an anchor to be able to find out how far away an enemy is able to travel before returning while using the move_type.DISTANCE

func _ready():
	# If we want to start the movement towards the left instead of towards the right this flips the sprite.
	# It also flips it towards the left it going downwards. Otherwise it does nothing.
	initial_direction = direction
	if direction == 2 or direction == -2:
		direction = direction / 2
	if direction < 0:
		animated_sprite.flip_h = true
		distance *= -1

func _physics_process(delta):
	if movement_type == move_type.HORIZONTAL_RAYCAST:		# The if statement is preparation for multiple types of movement.
		if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
			flip_direction()
	# TODO Elif statement for vertical_raycast move type.
	elif movement_type == move_type.DISTANCE:
		# This is math to check is the mob has travelled further than the distance that it should travel and if it has it'll turn it around.
		# It's a bit long but this is the shortest I could come up with for now.
		# This one is for the travel in the RIGHT direction
		if  initial_direction == 1 and (position.x - initial_position > distance or position.x < initial_position):
			flip_direction()
		# This one is for the travel in the LEFT direction
		if  initial_direction == -1 and (position.x - initial_position < distance or position.x > initial_position):
			flip_direction()
		# TODO The up/down directions, the probably don't need to use the flip_direction function because that'd flip
		# The sprite too. So doing it manually or updating flip_direction to not flip the sprite if the intitial direction
		# is too big.
	
	# Handles which type of position should be updated on the enemy. If it's a horizontal raycast or 
	# if it's moving a distance right or left then it should update the x position.
	if movement_type == move_type.HORIZONTAL_RAYCAST or (
		movement_type == move_type.DISTANCE and (initial_direction == 1 or -1)): 
		position.x += direction * SPEED * delta
	# TODO Add an elif condition for the VERTICAL RAYCAST and the up/down distance settings to move position.y instead.
	# Remember that the direction is bigger on the vertical distance ones

func flip_direction():
			direction *= -1 # Multiply by -1 swaps the value between positive and negative
			animated_sprite.flip_h = !animated_sprite.flip_h # Changes to opposite value
