extends KinematicBody2D

class_name Player

export(int) var SPEED = 200
export(int) var ACCEL = 20
export(bool) var PLAYERONE = true
export(Color) var PongColor
export(bool) var Bot = false
export(float, 0, 1) var BOT_DIFFICULTY = .75

onready var screen = get_viewport_rect().size

var ball = preload("res://Ball/Ball.tscn")
var velocity : Vector2 = Vector2.ZERO

func _ready():
	$ColorRect.color = PongColor
	initialize_pos()
	ball = get_parent().get_node("Ball")
#	This should not get reset with the x positions
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
		
	if Bot == true:
		bot_controls()
	
	if input == 0:
		velocity = Vector2.ZERO
	else:
		_move(input)
		
func initialize_pos():
	position.x = 10
	
	if !PLAYERONE:
		position.x = screen.x - 20

func bot_controls():
#	position.y = lerp(position.y, ball.position.y, .5)
	if (ball.position.y > position.y):
		velocity.y = lerp(velocity.y, SPEED, BOT_DIFFICULTY)
		move_and_slide(velocity)
	elif (ball.position.y < position.y):
		velocity.y = lerp(velocity.y, -SPEED, BOT_DIFFICULTY)
		move_and_slide(velocity)

func _move(input):
	velocity.y += input * ACCEL
	velocity.y = clamp(velocity.y, -SPEED, SPEED)
	move_and_slide(velocity)
