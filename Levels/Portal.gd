extends Area2D




func _ready():
	pass


func _on_Portal_to_2_body_entered(body):
	if body.name == "Player":
		if name == "Portal_to_2":
			var _target = get_tree().change_scene("res://Levels/Level2.tscn")
		if name == "Portal_to_3":
			Global.timer_on = false
			var _target = get_tree().change_scene("res://Levels/Game_Over.tscn")
			
