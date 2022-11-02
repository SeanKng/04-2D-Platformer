extends Control


func _ready():
	pass


func _physics_process(_delta):
	$Time.text = "Time: " +str(Global.text)

func _on_Play_again_pressed():
	var _scene = get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
