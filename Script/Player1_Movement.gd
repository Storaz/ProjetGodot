extends KinematicBody2D

const up = Vector2(0,-1)
const gravity = 20
const speed = 200
const jump = -550

var motion = Vector2()
var projectile = preload("res://Projectiles.tscn")

func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_d"):
		motion.x= speed
		$Player1_Sprite.flip_h= false
		$Player1_Sprite.play("Player1_Run")
	elif Input.is_action_pressed("ui_q"):
		motion.x= -speed
		$Player1_Sprite.flip_h= true
		$Player1_Sprite.play("Player1_Run")
	else:
		motion.x= 0
		$Player1_Sprite.play("Player1_Idle")
		
	if Input.is_action_pressed("ui_s"):
		var new_projectile = projectile.instance();
		$Player1_Sprite.play("Player1_Shoot")
		projectile.position = self.position
		get_tree().get_root().add_child(projectile)
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_z"):
			motion.y= jump
	else:
			$Player1_Sprite.play("Player1_Jump")
	
	motion = move_and_slide(motion,up)
	pass
