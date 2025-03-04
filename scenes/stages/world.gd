extends Node2D

@onready var tile_map_layer_input = $tile_map_layer_grass
@onready var player = $player

var tower = load("res://scenes/towers/tower.tscn")
var tower_position
var game_over = load

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_map_layer_input.z_index = -25
	#tile_map_layer_input.visible = false
	$CanvasModulate.color = Color(0.501961, 0.501961, 0.501961, 1)
	$CanvasModulate.visible = false
	$CanvasModulate.z_index = 100
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(Globals.button_clicked)
	if Globals.button_clicked:
		Engine.time_scale = 0.1
		$CanvasModulate.visible = true
		#print('ture')
		#modulate_tilemaps()
		
	else:
		Engine.time_scale = 1
		$CanvasModulate.visible = false
		#print('false')
		#unmodulate_tilemaps()
		
	print(Globals.abuse_detected)
	
	if player != null:
		if Globals.abuse_detected == true:
			var direction = Vector2(1, 0)  # Moves strictly to the right
			player.velocity = direction * 30
			player.move_and_slide()
		
		if player.visible == false:
			get_tree().change_scene_to_file("res://scenes/dialogue/game_over.tscn")
		
	if player == null:
		get_tree().change_scene_to_file("res://scenes/dialogue/endgame.tscn")



func _unhandled_input(event):
	#upon clicking, 
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#cells are grid positions of tile map layer, not screen coordinates
		var clicked_cell = tile_map_layer_input.local_to_map(tile_map_layer_input.get_local_mouse_position())
		
		#print(tile_map_layer_input.get_local_mouse_position())
		var actual_cell = Vector2i(16,8)
		var player_cell = tile_map_layer_input.local_to_map(player.position)
		var player_cell_array = [player_cell,player_cell-Vector2i(1,0),player_cell-Vector2i(1,-1),player_cell+Vector2i(0,1)]
		
		if Globals.base_timer_started == false and Globals.button_clicked and clicked_cell not in player_cell_array:
			Globals.grid_clicked = true
			var tower = tower.instantiate()
			tower_position = tile_map_layer_input.map_to_local(clicked_cell)
			tower.position = tower_position
			tower.radius(50)
			add_child(tower)
			Globals.button_clicked = false
			
			Globals.clicked_cell = clicked_cell
						
		else:
			Globals.button_clicked = false
