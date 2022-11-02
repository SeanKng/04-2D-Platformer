extends Node

var time = 0
var timer_on = true
var text = ""

var level = 1


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var menu = get_node_or_null("/root/Game/UI/Menu")
		if menu != null:
			var p = get_tree().paused
			if p:
				menu.hide()
				get_tree().paused = false
			else:
				menu.show()
				get_tree().paused = true	


func _process(delta):
	if timer_on == true:
		time += delta
		
	var secs = fmod(time, 60)
	var mins = fmod(time, 60*60) / 60	
	var hour = fmod(fmod(time, 3600*60) /3600,24)
		
	var time_passed = "%02d : %02d : %02d" % [hour ,mins, secs]	
	text = time_passed
		
	pass



	

	

