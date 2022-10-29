extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("Jumping")

func physics_process(_delta):
	if player.is_moving():
		player.jump_power.x = clamp(player.jump_power.x + (player.move_vector().x * player.leap_speed), -player.max_leap, player.max_leap)
	if Input.is_action_pressed("jump"):
		player.jump_power.y = clamp(player.jump_power.y - player.jump_speed, -player.max_jump, 0)
	else:
		player.velocity.y = 0
		player.velocity += player.jump_power
		player.move_and_slide(player.velocity, Vector2.UP)
		SM.set_state("Falling")
