extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer
@onready var jump_audio = $PlayerJumpAudio
@onready var pickup_double_jump = $"../Powerups/PickupDoubleJump"

const SPEED = 130.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var double_jumps = 0
var upgraded_double_jumps = 0
var fuck_git = true

func _physics_process(delta):
	
	if not is_on_floor(): # Add gravity if you're in the air
		velocity.y += gravity * delta
	else: # Otherwise reset double jump and coyote timer.
		double_jumps = upgraded_double_jumps
		coyote_timer.start()
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and coyote_timer.time_left > 0:
		coyote_timer.stop()
		velocity.y = JUMP_VELOCITY
		jump_audio.playing = true
	elif Input.is_action_just_pressed("jump") and double_jumps > 0:
		double_jumps -= 1
		velocity.y = JUMP_VELOCITY
		jump_audio.playing = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false

	# If you're pressing down you can pass through platforms on mask 3.
	if Input.is_action_pressed("down"):
		set_collision_mask_value(3, false)
	elif Input.is_action_just_released("down"):
		set_collision_mask_value(3, true)

	# Play Animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else: 
			animated_sprite.play("walk")
	else:
		animated_sprite.play("jump")

	# Control directions
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func upgrade_jumps():
	upgraded_double_jumps += 1




