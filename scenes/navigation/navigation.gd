#extends Node2D
#
#var navigation_mesh: NavigationPolygon
#var source_geometry : NavigationMeshSourceGeometryData2D
#var callback_parsing : Callable
#var callback_baking : Callable
#var region_rid: RID
#var outline: PackedVector2Array
#var new_outline
#
#
#func _ready() -> void:
	#navigation_mesh = NavigationPolygon.new()
	#navigation_mesh.agent_radius = 10.0
	#source_geometry = NavigationMeshSourceGeometryData2D.new()
	#callback_parsing = on_parsing_done
	#callback_baking = on_baking_done
	#region_rid = NavigationServer2D.region_create()
#
	## Enable the region and set it to the default navigation map.
	#NavigationServer2D.region_set_enabled(region_rid, true)
	#NavigationServer2D.region_set_map(region_rid, get_world_2d().get_navigation_map())
#
	## Some mega-nodes like TileMap are often not ready on the first frame.
	## Also the parsing needs to happen on the main-thread.
	## So do a deferred call to avoid common parsing issues.
	#parse_source_geometry.call_deferred()
#
#func parse_source_geometry() -> void:
	#source_geometry.clear()
	#var root_node: Node2D = self
#
	## Parse the obstruction outlines from all child nodes of the root node by default.
	#NavigationServer2D.parse_source_geometry_data(
		#navigation_mesh,
		#source_geometry,
		#root_node,
		#callback_parsing
	#)
	#
	#queue_redraw()
#
	#
#
#func on_parsing_done() -> void:
	## If we did not parse a TileMap with navigation mesh cells we may now only
	## have obstruction outlines so add at least one traversable outline
	## so the obstructions outlines have something to "cut" into.
#
	#outline = Globals.local_coord_list
	#
	##outline = PackedVector2Array([
	##Vector2(0.0, 0.0),
	##Vector2(500.0, 0.0),
	##Vector2(500.0, 500.0),
	##Vector2(0.0, 500.0)
	##])
	##source_geometry.add_traversable_outline(PackedVector2Array([Vector2(0, 0), Vector2(0, 50), Vector2(50, 50), Vector2(50, 0)]))
	##source_geometry.add_traversable_outline(PackedVector2Array([Vector2(22, 0), Vector2(42, 0), Vector2(42, 64), Vector2(22, 64)]))
	##print(outline)
	#
	##source_geometry.add_traversable_outline(outline)
#
	#for i in range(len(outline)/6):
		#new_outline = outline.slice(6*i,6*(i+1)-1)
		#source_geometry.add_traversable_outline(new_outline)
##
		###print(outline)
		##print(new_outline)
#
	## Bake the navigation mesh on a thread with the source geometry data.
	#NavigationServer2D.bake_from_source_geometry_data_async(
		#navigation_mesh,
		#source_geometry,
		#callback_baking
	#)
#
	#queue_redraw()
#
#
#
#func on_baking_done() -> void:
	## Update the region with the updated navigation mesh.
	#NavigationServer2D.region_set_navigation_polygon(region_rid, navigation_mesh)
#
#func _draw():
	##draw_polyline(outline, Color(0, 1, 0), 2)  # Green outline
#
	#if new_outline:
		#draw_polyline(outline, Color(0, 1, 0), 2)  # Green outline
		#print(new_outline)
		#print('abc')
		
		
extends Node2D

@export var grass:TileMapLayer 
#@onready grass: Tile
var index = 0
var astar_grid = AStarGrid2D.new()
var is_moving: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	generate_astar_grid()

	#generate_astar_grid().call_deferred()

				
	#generate_nav_mesh()
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	#generate_astar_grid()

	pass
	
func generate_astar_grid():
	if grass:
		astar_grid.region = grass.get_used_rect()
		print("No error")
		print(grass.get_used_rect())
	else:
		print("Error: grass is null!")
	#astar_grid.region = grass.get_used_rect()
	
	astar_grid.cell_size = Vector2(64,64)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	
	var region_size = astar_grid.region.size
	var region_position = astar_grid.region.position
	
	for x in region_size.x:
		for y in region_size.y:
			var tile_position = Vector2i(
				x + region_position.x,
				y + region_position.y
			)
			
			#var tile_data = grass.get_cell_tile_data(tile_position)
	#
			##print(tile_position)
			#
			#if tile_data == null:
				#astar_grid.set_point_solid(tile_position)
	pass
