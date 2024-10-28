extends CharacterBody2D


var speed = 7000

var jump_velocity = -400

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_released("player_jump") and velocity.y < 0:
		velocity.y = jump_velocity / 4
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = jump_velocity
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed * delta

	move_and_slide()
