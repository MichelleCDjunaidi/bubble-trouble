extends CharacterBody2D
class_name basic_enemy

@export var speed = 150


@export var player: Node2D
@export var health = 100
@export var area2d = Area2D
@export var stealth_skill = false

@onready var nav_agent:= $NavigationAgent2D as NavigationAgent2D
var movement_delta: float

#@onready var player = load("res://scenes/player/player.tscn")


func _ready():
	player = get_node("/root/World/player")
	stealth()
#$player
#movement of enemey is classfied as void
func _physics_process(delta: float) -> void:
	#direction based on navigation agent
	#converts global to local coordinates
	var dir= to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir*speed
	move_and_slide()
	#var next_position = _nav_agent.get_next_location()
	#movement_delta = speed * delta
	#var next_path_position: Vector2 = nav_agent.get_next_path_position()
	#var new_velocity: Vector2 = global_position.direction_to(next_path_position) * movement_delta
#
	#if nav_agent.avoidance_enabled:
		#nav_agent.set_velocity(new_velocity)
	#else:
		#_on_velocity_computed(new_velocity)
		#
#func _on_velocity_computed(safe_velocity: Vector2) -> void:
	#global_position = global_position.move_toward(global_position + safe_velocity, movement_delta)


	
func makepath() -> void:
	#check for path only when enemy is not queue_freed
	
	if is_instance_valid(player):
		nav_agent.target_position = player.global_position
		#print('move')
		
func _on_timer_timeout() -> void:
	makepath()

func _on_area_2d_area_entered(area: Area2D) -> void:
	#on entering player node, destroys itself
	print('area:',area.get_parent().name)
	if area.get_parent().name == 'player':
		queue_free()
		

		
func stealth():
	if stealth_skill:	
		self.modulate.a = 0.3
		#print('adjad')
