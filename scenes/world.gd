extends Node2D

#click on button
#button click programmed

#world slows down
#click on grid
#dont grid spawning if timer is enabled

@onready var tile_map_layer = $TileMapLayer
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
	#if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and Globals.button_clicked:
		#pass

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var clicked_cell = tile_map_layer.local_to_map(tile_map_layer.get_local_mouse_position())
		var actual_cell = Vector2i(16,8)
		
		if Globals.base_timer_started == false and tile_map_layer.get_cell_atlas_coords(clicked_cell) == actual_cell and Globals.button_clicked:
			Globals.grid_clicked = true
			
			var tower = tower.instantiate()
			tower.position = tile_map_layer.map_to_local(clicked_cell)
			add_child(tower)
			Globals.button_clicked = false			
		
		else:
			Globals.button_clicked = false
	
