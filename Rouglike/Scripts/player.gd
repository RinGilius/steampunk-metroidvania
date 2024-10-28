extends CharacterBody2D

@export var speed = 200

@export var max_speed = 200

@export var acel = 0

@onready var anim = $AnimatedSprite2D

var is_in_des = false

var on_touch = false

# jump velocity

@export var jump_velocity = -300

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	position = GameManager.change_position
	anim.play("player_idle")
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("enteract") and g.is_dialog == false:#'''an#'''and g.is_dialog == false and is_death == false and g.is_cutscene == false and velocity == Vector2.ZERO'''d g.is_dialog == false and is_death == false and g.is_cutscene == false and velocity == Vector2.ZERO'''
			var ent = %enteract.get_overlapping_areas()
			if ent.size() > 0:
				ent[0].action()
				return
	if g.is_dialog == false:
		if Input.is_action_just_pressed("player_jump") && is_on_floor():
			velocity.y = jump_velocity
			
		var direction = Input.get_axis("player_left","player_right")
		if direction:
			speed += 1.5
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x,0,speed)
			speed = 125
			
		if speed >= max_speed:
			speed = max_speed
		move_and_slide()
				
	if Input.is_action_just_pressed("player_jump"):
		if is_on_floor():
			velocity.y = jump_velocity * delta
	var direction = Input.get_axis("player_left","player_right")
	velocity.x = direction * speed * delta
	destructive()
	animate()
	

func animate():
	if velocity.x > 0:
		anim.flip_h = false
	elif velocity.x < 0:
		anim.flip_h = true
	if velocity.x:
		anim.play("player_move")
	else:
		anim.play("player_idle")


func _on_area_enemys_area_entered(area):
	if area.name == "Area_Destructive":
		is_in_des = true
	

func _on_area_enemys_area_exited(area):
	if area.name == "Area_Destructive":
		is_in_des = false

func destructive():
	if is_in_des == true and Input.is_action_just_pressed("is_move_box"):
		$"../DestructiveObject".queue_free()
