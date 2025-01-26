extends Node2D

#flag for timer
var timer_finished = true
var bullet = load("res://scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	timer_finished = true
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("malding2")
	var bullet_vector = position - body.position
	bullet_vector = bullet_vector.normalized()
	if timer_finished:
		print("what")
		var bullet_instance = bullet.instantiate()
		bullet_instance.set_velocity(bullet_vector)
		add_child(bullet_instance)
	#check timer
	#if yes, spawn bullet
	#aim it at area.position (do we need to do vector calculations?)
	timer_finished = false
	$Timer.start()
	pass # Replace with function body.
