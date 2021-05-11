extends KinematicBody2D

class_name Player

export(int) var SPEED = 200
export(int) var ACCEL = 20
export(bool) var PLAYERONE = true

onready var screen = get_viewport_rect().size

var playerName = "PlayerOne"

var velocity : Vector2 = Vector2.ZERO

func _ready():
	initialize_pos()
	position.y = screen.y / 2

func _physics_process(delta):
	if screen != get_viewport_rect().size:
		screen = get_viewport_rect().size
		initialize_pos()
	
	var input : float = 0
	
	if PLAYERONE:
		input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	else:
		input = Input.get_action_strength("p2_down") - Input.get_action_strength("p2_up")
	
	if input == 0:
		velocity = Vector2.ZERO
	else:
		_move(input)
		
func initialize_pos():
	position.x = 1
	
	if !PLAYERONE:
		position.x = screen.x - 10

func _move(input):
	velocity.y += input * 20
	velocity.y = clamp(velocity.y, -SPEED, SPEED)
	move_and_slide(velocity)
