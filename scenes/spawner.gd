extends Node2D
var sequence = [5,4,3,2,1]
var enemy = load("res://scenes/enemy.tscn")
var index = 0
var can_leave = false
var instance
# Called when the node enters the scene tree for the first time.
@onready var spawner = $"."

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_tree().get_nodes_in_group("enemy").size()==0 and can_leave):
		go_to_dialogue()
	#despawns enemy upon entering player location
	if Globals.enemy_entered and is_instance_valid(instance):
		instance.queue_free()
		
func _on_timer_timeout():
	if(index==sequence.size()):
		can_leave = true
		$Timer.stop()
		Globals.spawn_enemy=false
	else:
		instance = enemy.instantiate()
		instance.position = spawner.position 
		get_parent().add_child(instance)
		$Timer.start(sequence[index])
		index += 1
		Globals.spawn_enemy=true

func go_to_dialogue():
	get_tree().change_scene_to_file("res://scenes/endgame.tscn")
