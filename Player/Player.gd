extends KinematicBody2D

class_name Player

export(int) var SPEED = 200
export(int) var ACCEL = 20

var playerName = "PlayerOne"

onready var max_height = get_viewport().size.y
onready var player_height = $ColorRect.get_rect().size.y

var velocity : Vector2 = Vector2.ZERO

func _physics_process(delta):
	
	var input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input == 0:
		velocity = Vector2.ZERO
	else:
		_move(input)

func _move(input):
	velocity.y += input * 20
	velocity.y = clamp(velocity.y, -SPEED, SPEED)
	move_and_slide(velocity)
