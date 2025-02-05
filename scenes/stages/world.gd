extends Node2D

@onready var tile_map_layer = $TileMapLayerGrass
@onready var player = $player

var tower = load("res://scenes/tower.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(Globals.button_clicked)
	if Globals.button_clicked:
		Engine.time_scale = 0.1
		tile_map_layer.modulate = Color(0.501961, 0.501961, 0.501961, 1) # Normalized RGBA values

	else:
		Engine.time_scale = 1
		tile_map_layer.modulate = Color(1,1,1,1) # Normalized RGBA values

func _unhandled_input(event):
	#upon clicking, 
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#cells are grid positions of tile map layer, not screen coordinates
		var clicked_cell = tile_map_layer.local_to_map(tile_map_layer.get_local_mouse_position())
		var actual_cell = Vector2i(16,8)
		var player_cell = tile_map_layer.local_to_map(player.position)
		var player_cell_array = [player_cell,player_cell-Vector2i(1,0),player_cell-Vector2i(1,-1),player_cell+Vector2i(0,1)]
		
		if Globals.base_timer_started == false and Globals.button_clicked and clicked_cell not in player_cell_array:
			Globals.grid_clicked = true
			var tower = tower.instantiate()
			tower.position = tile_map_layer.map_to_local(clicked_cell)
			add_child(tower)
			Globals.button_clicked = false			
		else:
			Globals.button_clicked = false
	
