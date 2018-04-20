extends KinematicBody2D

const up = Vector2(0,-1)
const gravity = 20
const speed = 200
const jump = -550

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x= speed
		$Player2_Sprite.flip_h= true
		$Player2_Sprite.play("Player2_Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x= -speed
		$Player2_Sprite.flip_h= false
		$Player2_Sprite.play("Player2_Run")
	else:
		motion.x= 0
		$Player2_Sprite.play("Player2_Idle")
		
	if Input.is_action_pressed("ui_down"):
		$Player2_Sprite.play("Player2_Shoot")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y= jump
	else:
			$Player2_Sprite.play("Player2_Jump")
	
	motion = move_and_slide(motion,up)
	pass
