extends CharacterBody2D

@onready var player = $"../Player"
func  _process(delta):
	if Input.is_action_pressed("is_move_box", 1):
		velocity.x = player.velocity.x
