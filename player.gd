extends CharacterBody2D


const speed = 300.0
#const JUMP_VELOCITY = -400.0
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	##if not is_on_floor():
		##velocity += get_gravity() * delta
#
	## Handle jump.
	##if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		##velocity.y = JUMP_VELOCITY
##
	### Get the input direction and handle the movement/deceleration.
	### As good practice, you should replace UI actions with custom gameplay actions.
	##var direction := Input.get_axis("ui_left", "ui_right")
	##if direction:
		##velocity.x = direction * SPEED
	##else:
		##velocity.x = move_toward(velocity.x, 0, SPEED)
		#
	#if Input.is_action_pressed("move_right"):
		#velocity.x = 50
	#if Input.is_action_pressed("move_left"):
		#velocity.x = -50
	#if Input.is_action_pressed("move_down"):
		#velocity.y = 50
	#if Input.is_action_pressed("move_up"):
		#velocity.y = -50
#
	##if velocity.length() > 0:
		##velocity = velocity.normalized() * speed
		##$AnimatedSprite2D.play()
	##else:
		##$AnimatedSprite2D.stop()
		#
	#position += velocity * delta
#
	#move_and_slide()
