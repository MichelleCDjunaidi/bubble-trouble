extends CharacterBody2D

const speed = 150

@export var player: Node2D
@onready var nav_agent:= $NavigationAgent2D as NavigationAgent2D

func _ready():
	player = get_node("/root/World/player")
	print(player)
#movement of enemey is classfied as void
func _physics_process(delta: float) -> void:
	#direction based on navigation agent
	#converts global to local coordinates
	var dir= to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir*speed
	move_and_slide()
	
func makepath() -> void:
	nav_agent.target_position = player.global_position
		



func _on_timer_timeout() -> void:
	makepath()
