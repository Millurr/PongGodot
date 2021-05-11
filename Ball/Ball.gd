extends RigidBody2D

var dir = 1

func _ready():
	add_force(Vector2(0, 0), Vector2(-200, 0))
	
func _physics_process(delta):
	for value in get_colliding_bodies():
		print(value)


func _on_Ball_body_entered(body):
	if (body.get_class() == "KinematicBody2D"):
		if (body.playerName == "PlayerOne"):
			add_force(Vector2(0, 0), Vector2(200, 400))
