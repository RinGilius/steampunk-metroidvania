extends CharacterBody2D

var speed = 10000

func _physics_process(delta):
	var direction = Input.get_vector("player_left","player_right","player_up","player_down")
	velocity = direction * speed * delta
	move_and_slide()
