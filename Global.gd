extends Node

var time = 0
var timer_on = true
var text = ""

var level = 1

func _process(delta):
	if(timer_on):
		time += delta
		
	var secs = fmod(time, 60)
	var mins = fmod(time, 60*60) / 60	
	var hour = fmod(fmod(time, 3600*60) /3600,24)
		
	var time_passed = "%02d : %02d : %02d" % [hour ,mins, secs]	
	text = time_passed
		
	pass


func _ready():
	pass
	

	

	

