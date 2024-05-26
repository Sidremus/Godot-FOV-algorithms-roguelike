extends Node2D

@onready var tilemap : TileMap = get_parent().get_node("TileMap")
var map_position

signal player_moved

func _ready():
	map_position = tilemap.local_to_map(position)

func _input(event):
	if event.is_action_pressed("ui_up"):
		if process_movement(Vector2i(Vector2.UP)): map_position += Vector2i(Vector2.UP)
		
	if event.is_action_pressed("ui_down"):
		if process_movement(Vector2i(Vector2.DOWN)): map_position += Vector2i(Vector2.DOWN)
		
	if event.is_action_pressed("ui_left"):
		if process_movement(Vector2i(Vector2.LEFT)): map_position += Vector2i(Vector2.LEFT)
		
	if event.is_action_pressed("ui_right"):
		if process_movement(Vector2i(Vector2.RIGHT)): map_position += Vector2i(Vector2.RIGHT)
	
	position = tilemap.map_to_local(map_position)
	emit_signal("player_moved")

func process_movement(direction: Vector2i) -> bool:
	var tile_type = tilemap.get_cell_source_id(0, map_position + direction)
	if tile_type == 1:
		return false
	else:
		return true
