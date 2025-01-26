extends Node2D
var sequence = [5,4,3,2,1]
var enemy = load("res://scenes/enemy.tscn")
var index = 0
var can_leave = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_tree().get_nodes_in_group("enemy").size()==0 and can_leave):
		go_to_dialogue()
		pass
	pass


func _on_timer_timeout():
	if(index==sequence.size()):
		can_leave = true
		$Timer.stop()
	else:
		print("a")
		var instance = enemy.instantiate()
		print("b")
		get_parent().add_child(instance)
		$Timer.start(sequence[index])
		index += 1

func go_to_dialogue():
	get_tree().change_scene_to_file("res://scenes/endgame.tscn")
	pass
	#go to the dialogue scene
