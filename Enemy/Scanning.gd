extends Node

onready var SM = get_parent()
onready var enemy = get_node("../..")
onready var ray = enemy.get_node("RayCast2D")

func _ready():
	yield(enemy, "ready")

func physics_process(_delta):
	if enemy.increasing:
		enemy.increase_turret()
	else:
		enemy.decrease_turret()
	enemy.set_turret_angle(enemy.turret_pos)
	enemy.set_ray_angle(enemy.turret_pos)
	ray.cast_to = Vector2(-1000,0)
	enemy.update_laser(enemy.to_local(ray.get_collision_point()),false)
	var c = ray.get_collider()
	if c and c.name == "Player":
		SM.set_state("Searching")
