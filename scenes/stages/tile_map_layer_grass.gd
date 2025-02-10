extends TileMapLayer

@onready var rock:TileMapLayer =  $"../tile_map_layer_rock"
@onready var grass:TileMapLayer =  $"../tile_map_layer_grass"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.clicked_cell != Vector2i(-1, -1):
		var data1 = grass.get_cell_tile_data(Globals.clicked_cell)
		print(Globals.clicked_cell)
		#var data3 = grass.get_cell_tile_data(Globals.clicked_cell+Vector2i(1,0))
		Globals.flag = true
		_tile_data_runtime_update(Globals.clicked_cell,data1)
		#_tile_data_runtime_update(Globals.clicked_cell,data2)
		#_tile_data_runtime_update(Globals.clicked_cell,data3)
		
		#data.set_navigation_polygon(0,null)
		#print(data)
		Globals.flag = false
		Globals.clicked_cell = Vector2i(-1, -1)

func _use_tile_data_runtime_update(coords):
	if coords in rock.get_used_cells_by_id(3):
		return true
	return false


		
func _tile_data_runtime_update(coords:Vector2i,tile_data:TileData):
	if Globals.flag:
		tile_data.set_navigation_polygon(0,null)
		print('kaldka')

	#print('update')
	if coords in rock.get_used_cells_by_id(3):
		tile_data.set_navigation_polygon(0,null)
		#
	#print(coords,'coords','rock:',rock)
	#_tile_data_runtime_update(0, Globals.clicked_cell)
	#print('clicked_cell:',Globals.clicked_cell)
		

	
