extends Area2D

const speed_projectiles = 200
const destroy = 15.0

func _ready():
	pass
	
func _physics_process(delta):
	if destroy<0:
		queue_free()
	else:
		destroy -= 1 * delta
	move_local_x(speed_projectiles * delta)
	pass