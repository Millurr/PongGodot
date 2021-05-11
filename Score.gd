extends Node2D

onready var screen_size = get_viewport_rect().size

onready var player_one_score : int = 0
onready var player_two_score : int = 0

func _ready():
	$PlayerOne.text = "0"
	$PlayerTwo.text = "0"
	initialize_pos()
	
func _process(delta):
	if screen_size != get_viewport_rect().size:
		screen_size = get_viewport_rect().size
		initialize_pos()
		
func initialize_pos():
	$PlayerOne.rect_position.x = screen_size.x / 2 - 10
	$PlayerOne.rect_position.y = 5
	
	$PlayerTwo.rect_position.x = screen_size.x / 2 + 10
	$PlayerTwo.rect_position.y = 5

func add_player_one():
	player_one_score += 1
	$PlayerOne.text = str(player_one_score)
	
func add_player_two():
	player_two_score += 1
	$PlayerTwo.text = str(player_two_score)

func _on_Ball_score_change(value):
	if value == true:
		add_player_one()
	elif value == false:
		add_player_two()
