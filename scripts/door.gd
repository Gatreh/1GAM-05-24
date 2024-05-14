extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var is_open : bool = false
@export var allow_open : bool = true
@export var allow_close : bool = true

func _ready():
	# change animation state based on if the door is supposed to start open or not
	if is_open:
		animated_sprite_2d.play("open")

func _on_body_entered(body):
	if not is_open and allow_open:
		animated_sprite_2d.play("opening")
		is_open = true


func _on_body_exited(body):
	if is_open and allow_close:
		animated_sprite_2d.play("closing")
		is_open = false
