extends Button

export var path = "res://Scenes/Playable/World.tscn"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func on_press():
	get_tree().change_scene(path)

