extends Area2D

@export var change_scene = ""

@export var change_position = Vector2()

var in_perehod = false

@onready var player = preload("res://Scenes/player.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("perehod") and in_perehod == true:
		get_tree().change_scene_to_file(change_scene)
		GameManager.change_position = change_position

func _on_body_entered(body):
	in_perehod = true
	
	


func _on_body_exited(body):
	in_perehod = false
