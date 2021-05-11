extends Area2D

export(float, 1, 2) var speed_multiplyer = 1

onready var SCREEN_SIZE : Vector2 = get_viewport_rect().size

signal score_change

var speed : Vector2 = Vector2()
var score : Array = [0, 0]

func _ready():
	randomize()
	reset()

func _process(delta):
	if SCREEN_SIZE != get_viewport_rect().size:
		SCREEN_SIZE = get_viewport_rect().size
	
	position += speed.rotated(rotation) * delta
	
	if isOutOfBounds():
		reset()

func _on_Ball_body_entered(body):
	if body.is_in_group("Players"):
		rotation = -rotation
		speed = -speed * speed_multiplyer
		rotation_degrees = rand_range(-45, 45)
	else:
#		rotation = -rotation
		if (rotation_degrees > 0):
			rotation_degrees = rand_range(-30, -45)
		else:
			rotation_degrees = rand_range(30, 45)

func reset():
	position = SCREEN_SIZE / 2
	
	var ran = rand_range(0, 100)

	if ran < 50:
		speed = Vector2(-200, 0)
	else:
		speed = Vector2(200, 0)
		
func isOutOfBounds() -> bool:
	if position.x < 0:
		emit_signal("score_change", false)
		return true
	elif position.x > SCREEN_SIZE.x:
		emit_signal("score_change", true)
		return true
	return false
	
# Pass in true when player one scores and false when player 2 scores
func score_change(playerOne) -> bool:
	return playerOne
