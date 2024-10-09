extends CharacterBody2D

var speed = 10000

var jump_velocity = -25000

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	position = GameManager.change_position
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("player_jump"):
		if is_on_floor():
			velocity.y = jump_velocity * delta
	var direction = Input.get_axis("player_left","player_right")
	velocity.x = direction * speed * delta
	move_and_slide()
