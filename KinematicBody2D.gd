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
		$Player_Sprite1.flip_h= false
		$Player_Sprite1.play("Run1")
	elif Input.is_action_pressed("ui_left"):
		motion.x= -speed
		$Player_Sprite1.flip_h= true
		$Player_Sprite1.play("Run1")
	else:
		motion.x= 0
		$Player_Sprite1.play("Idle1")
		
	if Input.is_action_pressed("ui_space"):
		$Player_Sprite1.play("Shoot1")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y= jump
	else:
			$Player_Sprite1.play("Jump1")
	
	motion = move_and_slide(motion,up)
	pass
