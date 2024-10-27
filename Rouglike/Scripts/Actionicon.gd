extends Sprite2D


func _ready() -> void:
	hide()
#func _process(_delta) -> void:
	#if g.platform == g.Platform.PC:
		#$Label.visible = true
		#$Sprite2D.visible = false
	#else:
		#$Label.visible = false
		#$Sprite2D.visible = true


func _on_visible_on_screen_enabler_2d_screen_entered():
	set_process(true)


func _on_visible_on_screen_enabler_2d_screen_exited():
	set_process(false)
