extends Area2D

class_name Player

export(int) var SPEED = 200

onready var max_height = get_viewport().size.y
onready var player_height = $ColorRect.get_rect().size.y

func _process(delta):
	var input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	position.y = clamp(position.y, 0, max_height-player_height)
	position.y += input * SPEED * delta


func _on_Player_body_entered(body):
	print(body)
	pass # Replace with function body.


func _on_Player_area_entered(area):
	print(area)
	pass # Replace with function body.
