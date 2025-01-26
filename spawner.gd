extends Node2D
var sequence = [5,4,3,2,1]
var enemy = load("res://scenes/bullet.tscn")
var index = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if(index==sequence.size()):
		go_to_dialogue()
	else:
		var instance = enemy.instantiate()
		add_child(instance)
		$Timer.start(sequence[index])
		index += 1

func go_to_dialogue():
	print("going to dialogue")
	pass
	#go to the dialogue scene
