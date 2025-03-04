extends CharacterBody2D

#var speed = 0
var index = 0
var is_moving: bool


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
	if scale[0] < 0.5:
		visible = false
	scale = scale*0.9
	

	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
