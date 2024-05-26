extends Control

func _on_Button_pressed():
	get_tree().change_scene_to_file("res://scenes/Raycasting.tscn")

func _on_Button2_pressed():
	get_tree().change_scene_to_file("res://scenes/Shadowcasting.tscn")

func _on_external_link_label_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse_button"):
		OS.shell_open("https://github.com/Sidremus/Godot-FOV-algorithms-roguelike")
