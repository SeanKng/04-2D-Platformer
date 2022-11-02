extends Node

onready var SM = get_parent()
onready var enemy = get_node("../..")

onready var player = null
onready var ray = enemy.get_node("RayCast2D")
onready var laser = enemy.get_node("Laser")
onready var timer = enemy.get_node("Search_Time")

func _ready():
	yield(enemy, "ready")

func start():
	enemy.found = false
	timer.start()

func end():
	timer.stop()
	

func physics_process(_delta):
	player = get_node_or_null("/root/Game/Player_Container/Player")
	if player == null:
		SM.set_state("Scanning")
	else:
		var player_pos = ray.to_local(player.global_position)
		ray.cast_to = player_pos
		enemy.update_laser(enemy.to_local(ray.get_collision_point()),true)
		var ang = wrapf(rad2deg(laser.points[0].angle_to_point(laser.points[1])),0,360)
		if ang < 180:
			enemy.set_turret_angle(ang)
		var c = ray.get_collider()
		if c and not c.name == "Player":
			SM.set_state("Scanning")
		if enemy.found:
			SM.set_state("Found")
