extends Node2D

#flag for timer
var timer_finished = true
var bullet = load("res://scenes/towers/bullet.tscn")
var curr_target = null
var reload = false
var detected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if curr_target != null:
		var bullet_vector = curr_target.position - position
		bullet_vector = bullet_vector.normalized()
		var bullet_instance = bullet.instantiate()
		#print('bullet')
		bullet_instance.set_velocity(bullet_vector)
		#add_child(bullet_instance)
		$AudioStreamPlayer2D.play()
		
	set_process(false)
	await get_tree().create_timer(0.5).timeout
	set_process(true)
	
	
	
		


#
	#
#func _on_detection_timer_timeout() -> void:
	##if target is detected, shoot once and start reloading.
		#
	#if curr_target != null and reload == false:
		#var bullet_vector = curr_target.position - position
		#bullet_vector = bullet_vector.normalized()
		#if timer_finished:
			#var bullet_instance = bullet.instantiate()
			##print('bullet')
			#bullet_instance.set_velocity(bullet_vector)
			#add_child(bullet_instance)
			#$AudioStreamPlayer2D.play()
		#set_paused
		#timer_finished = false

	

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	curr_target = body
	print(curr_target)
	#check timer
	#if yes, spawn bullet
	#aim it at area.position (do we need to do vector calculations?)
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if curr_target == body:
		curr_target = null
	pass # Replace with function body.
	
func radius(radius):
	$CollisionShape2D.get_shape().set_radius(radius)
