extends Node2D

var velocity = Vector2(1, 1)
var speed = 600

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity*delta*speed
	
func set_velocity(new_velocity: Vector2):
	velocity = new_velocity
	pass
