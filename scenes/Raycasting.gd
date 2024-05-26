extends Node2D

# Retrieve references to the tile maps for the game's terrain/fog and player.
@onready var tilemap : TileMap = get_node("TileMap")
@onready var fog : TileMap = get_node("Fog")
@onready var player = get_node("Hero")

# Define the player's view distance.
var view_distance = 12

# Dictionary to store tiles that the player has discovered.
var discovered_tiles = {}

func _ready():
	# Update the field of view when the game starts.
	update_fov()
	get_window().set_title("Raycasting FOV algorithm")

func _on_Hero_player_moved():
	# Update the field of view each time the player moves.
	update_fov()

# Handle mouse click events to add/remove walls.
func _input(event):
	if event.is_action_pressed("left_mouse_button"):
		var tile_position = tilemap.local_to_map(get_viewport().get_mouse_position())
		tilemap.set_cell(0, tile_position, 1, Vector2i(0, 0), 0)

	if event.is_action_pressed("right_mouse_button"):
		var tile_position = tilemap.local_to_map(get_viewport().get_mouse_position())
		tilemap.set_cell(0, tile_position, 0, Vector2i(0, 0), 0)

	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/Main.tscn")

func update_fov():
	# Get the player's position in tile map coordinates.
	var player_position = tilemap.local_to_map(player.global_position)

	# Set previously discovered tiles back to soft-fog.
	for tile in discovered_tiles.keys():
		fog.set_cell(0, tile, 1, Vector2i(0, 0), 0)

	# Perform raycasting from the player's position.
	raycast_fov(player_position)

func raycast_fov(origin : Vector2):
	# Raycasting in all directions around the player.
	for x in range(-view_distance, view_distance + 1):
		for y in range(-view_distance, view_distance + 1):
			# Ignore the origin point.
			if x == 0 and y == 0: continue
			# Determine the endpoint for this ray.
			var end_tile = origin + Vector2(x, y)
			# If the tile is within view range, perform line tracing towards it.
			if end_tile.distance_to(origin) <= view_distance:
				bresenham_line(origin as Vector2i, end_tile as Vector2i)

func bresenham_line(start:Vector2i, end:Vector2i):
	# Implementation of Bresenham's line drawing algorithm on a tile map.
	var x0 = start.x
	var y0 = start.y
	var x1 = end.x
	var y1 = end.y

	var dx = abs(x1 - x0)
	var dy = abs(y1 - y0)
	var sx = 1 if x0 < x1 else -1
	var sy = 1 if y0 < y1 else -1
	var err = dx - dy

	while true:
		# Set the current tile as visible and mark it as discovered.
		var tile = Vector2(x0, y0)
		fog.set_cell(0, tile, 0, Vector2i(-1, -1), -1)
		fog.set_cell(0, tile, 1, Vector2i(-1, -1), -1)
		discovered_tiles[tile] = true

		# If an obstacle is encountered in the line of sight, terminate line tracing.
		if tilemap.get_cell_source_id(0, tile) == 1: return
		
		# If the endpoint is reached, end the loop.
		if x0 == x1 and y0 == y1: return
		
		# Update the current position based on the accumulated error.
		var e2 = 2 * err
		if e2 > -dy:
			err -= dy
			x0 += sx
		if e2 < dx:
			err += dx
			y0 += sy
