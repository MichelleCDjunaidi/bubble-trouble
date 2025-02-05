extends TileMapLayer

@onready var rock:TileMapLayer =  $"../tile_map_layer_rock"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _use_tile_data_runtime_update(coords):
	if coords in rock.get_used_cells_by_id(3):
		print('a')
		return true
	#print('b')
	return false
		
func _tile_data_runtime_update(coords:Vector2i,tile_data:TileData):
	if coords in rock.get_used_cells_by_id(3):
		tile_data.set_navigation_polygon(0,null)
		print(tile_data)
		#print(tile_data.get_navigation_polygon(3))
		#print('a')
