extends Area2D

@export var dialog : DialogueResource

@export var action_icon : Sprite2D

@export var portret : Texture2D

@export var begin : String = "start"

@export var is_iam : bool


func action():
	is_iam = true
	DialogueManager.show_example_dialogue_balloon(dialog,begin)
	g.is_dialog = true
	return
	

func _on_area_entered(_area):
	$Actionicon.show()


func _on_area_exited(_area):
	$Actionicon.hide()
