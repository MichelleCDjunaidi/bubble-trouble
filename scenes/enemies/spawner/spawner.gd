extends Node2D
#var sequence = [1,1,1,1,1]
var enemy = load("res://scenes/enemies/normal enemies/enemy.tscn")
var fast_enemy = load("res://scenes/enemies/normal enemies/fast_enemy.tscn")
var invis_enemy = load('res://scenes/enemies/normal enemies/invis_enemy.tscn')
var index = 0
var can_leave = false
var instance
# Called when the node enters the scene tree for the first time.
@onready var spawner = $"."

func _ready():
	$Timer.start()
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_tree().get_nodes_in_group("enemy").size()==0 and can_leave):
		go_to_dialogue()

func instantiate_enemy(enemy_type):
	instance = enemy_type.instantiate()
	instance.position = spawner.position 
	instance.name = "instance_" + str(index)
	get_parent().add_child(instance)
	#index += 1
		
func _on_timer_timeout():
	if index == 5:
		can_leave = true
		$Timer.stop()
	else:
		instantiate_enemy(fast_enemy)
		instantiate_enemy(enemy)
		instantiate_enemy(invis_enemy)
		index += 1
		print(index)

func go_to_dialogue():
	get_tree().change_scene_to_file("res://scenes/dialogue/endgame.tscn")
