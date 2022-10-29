extends Control


func _ready():
	pass

func _physics_process(_delta):
	$Time.text = "Time: " +str(Global.text)
