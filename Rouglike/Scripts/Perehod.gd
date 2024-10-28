extends Area2D

@export var change_scene = ""

@export var change_position = Vector2()

#@onready var player = $Player

func _on_body_entered(body):
	if body is player:
		get_tree().change_scene_to_file(change_scene)
		GameManager.change_position = change_position
	
