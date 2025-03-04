extends CharacterBody2D
class_name basic_enemy

@export var speed = 150
@export var player: Node2D
@export var health = 100
@export var area2d = Area2D
@export var stealth_skill = false

var grass
var movement_delta: float
var is_moving:bool
var external_astar_grid
var current_position
var target_position
var tilemap
var current_path: Array[Vector2i]
var click:bool

@export var movement_speed = 150
#@onready var player = load("res://scenes/player/player.tscn")


func _ready():
	player = get_node_or_null("/root/World/player")
	tilemap = get_node_or_null("/root/World/tile_map_layer_grass")
	external_astar_grid = get_node_or_null("/root/World/tile_map_layer_grass").astar

	if !player:
		print("Error: Player node not found!")
	if !grass:
		print("Error: Grass node not found!")
	if !external_astar_grid:
		print("Error: AStarGrid not found!")
		
	current_path = tilemap.astar.get_id_path(
		tilemap.local_to_map(global_position),
		tilemap.local_to_map(player.global_position)
	).slice(1)
		
	stealth()
	
##recalculate path
func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:	
		click = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	#on entering player node, destroys itself
	print(area.get_parent().name)
	if area.get_parent().name == 'player':
		queue_free()
		print('destory myself')


func _on_area_2d_body_entered(body: Node2D) -> void:
	print('entered')
	body.queue_free()
	pass # Replace with function body.

func _physics_process(_delta):
	if current_path.is_empty():
		return
	if click == true:
		current_path = tilemap.astar.get_id_path(
		tilemap.local_to_map(global_position),
		tilemap.local_to_map(player.global_position)
		).slice(1)
		click = false
		
	if current_path.front() == null:
		Globals.abuse_detected = true
		
	if current_path.front() != null:
		print(current_path.front())
		var target_position = tilemap.map_to_local(current_path.front())
		var direction = (target_position - global_position).normalized()
		velocity = direction * speed
		
		move_and_slide()
			
		if (global_position - target_position).length() < speed * _delta:
			global_position = target_position
			current_path.pop_front()
	#else:
		#current_path.pop_front()
		#Globals.abuse_detected == true
		#print('adhjadhjad')
		#print('adhjadhjad')
		#print('adhjadhjad')
						
	
	
			
	
		#
func stealth():
	if stealth_skill:	
		self.modulate.a = 0.3
