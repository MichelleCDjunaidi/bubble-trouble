extends TileMapLayer

@onready var rock:TileMapLayer =  $"../tile_map_layer_rock"
@onready var grass:TileMapLayer =  $"../tile_map_layer_grass"

var astar = AStarGrid2D.new()
var map_rect = Rect2i()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var tile_size = Vector2i(64,64)
	var tilemap_size = get_used_rect().end - get_used_rect().position
	map_rect = Rect2i(Vector2i(), tilemap_size)
	
	astar.region = map_rect
	astar.cell_size = tile_size
	astar.offset = tile_size * 0.5
	astar.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	astar.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar.update()
	
	for i in tilemap_size.x:
		for j in tilemap_size.y:
			var coordinates = Vector2i(i, j)
			var tile_data = rock.get_cell_tile_data(coordinates)
			if tile_data:
				astar.set_point_solid(coordinates)
				
	

func is_point_walkable(local_position):
	var map_position = local_to_map(local_position)
	if map_rect.has_point(map_position):
		return not astar.is_point_solid(map_position)
	return false


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#
#
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		astar.set_point_solid(grass.local_to_map(grass.get_local_mouse_position()))

	


func _use_tile_data_runtime_update(coords):
	#appends corners of each grid cell
	#var current_coords = Vector2(map_to_local(coords))
	#var pixel_offset: int = 25
	#
	##coordinates of 64 pixel grid cell edges
	##var top_left_poly = Vector2(map_to_local(coords)) + Vector2(-Globals.pixel_size/2,-Globals.pixel_size/2)
	##var top_right_poly = Vector2(map_to_local(coords)) + Vector2(Globals.pixel_size/2,-Globals.pixel_size/2)
	##var btm_left_poly = Vector2(map_to_local(coords)) + Vector2(-Globals.pixel_size/2,Globals.pixel_size/2)
	##var btm_right_poly = Vector2(map_to_local(coords)) + Vector2(Globals.pixel_size/2,Globals.pixel_size/2)
	#
	##points that form a cross
	##var poly_1 = current_coords + Vector2(-Globals.pixel_size/2+pixel_offset,-Globals.pixel_size/2)
	##var poly_2 = current_coords + Vector2(Globals.pixel_size/2-pixel_offset,-Globals.pixel_size/2)
	##var poly_3 = current_coords + Vector2(Globals.pixel_size/2,-Globals.pixel_size/2+pixel_offset)
	##var poly_4 = current_coords + Vector2(Globals.pixel_size/2,Globals.pixel_size/2-pixel_offset)
	##var poly_5 = current_coords + Vector2(Globals.pixel_size/2-pixel_offset,Globals.pixel_size/2)
	##var poly_6 = current_coords + Vector2(-Globals.pixel_size/2+pixel_offset,Globals.pixel_size/2)
	##var poly_7 = current_coords + Vector2(-Globals.pixel_size/2,Globals.pixel_size/2-pixel_offset)
	##var poly_8 = current_coords + Vector2(-Globals.pixel_size/2+pixel_offset,-Globals.pixel_size/2)
#
	#var poly_1 = Vector2(-pixel_offset, -Globals.pixel_size/2) + current_coords
	#var poly_2 = Vector2(pixel_offset, -Globals.pixel_size/2) + current_coords
	#var poly_3 = Vector2(-pixel_offset, Globals.pixel_size/2) + current_coords
	#var poly_4 = Vector2(pixel_offset, Globals.pixel_size/2) + current_coords
#
#
	#var poly_5 = Vector2(-Globals.pixel_size/2,-pixel_offset) + current_coords
	#var poly_6 = Vector2(-Globals.pixel_size/2,pixel_offset) + current_coords
	#var poly_7 = Vector2(Globals.pixel_size/2,-pixel_offset) + current_coords
	#var poly_8 = Vector2(Globals.pixel_size/2,pixel_offset) + current_coords
	##print(poly_1,poly_2,poly_3,poly_4)
	##var poly_2 = current_coords + Vector2(5,-5)
#
	#
	##print(poly_1,poly_2,poly_3,poly_4)
	#
	##Globals.local_coord_list.append_array([poly_1,poly_2,poly_5,poly_6,poly_3,poly_4,poly_7,poly_8])
	##Globals.local_coord_list.append_array([poly_1])
#
	##print('list:',Globals.local_coord_list)
	##if index <1:
		##Globals.local_coord_list.append_array([poly_1, poly_2,poly_4,poly_3,poly_1])
		###Globals.local_coord_list.append_array([poly_1, poly_2])
		##
		##print(poly_1,poly_2)
##
		##index+=1
		#
	##Globals.local_coord_list.append_array([poly_1, poly_2,poly_4,poly_3,poly_1])
	#
	##Globals.local_coord_list.append_array([poly_1, poly_2,poly_4,poly_3,poly_5,poly_6,poly_8,poly_7])
	#Globals.local_coord_list.append_array([poly_1, poly_2,poly_4,poly_3,poly_1])


	

	
	if coords in rock.get_used_cells_by_id(3):
		#print('1')
		return true
	#print('2')
	return false


		
func _tile_data_runtime_update(coords:Vector2i,tile_data:TileData):
	pass
	#if coords in rock.get_used_cells_by_id(3):
		#tile_data.set_navigation_polygon(0,null)
		#
	#print(coords,'coords','rock:',rock)
	#_tile_data_runtime_update(0, Globals.clicked_cell)
	#print('clicked_cell:',Globals.clicked_cell)
		

	
