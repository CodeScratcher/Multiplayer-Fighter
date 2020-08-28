


extends Node

var current_scene = null
var which_ip:int
func _ready():
	var root = get_tree().get_root()
	print_debug(root)
	current_scene = root.get_child(root.get_child_count() - 1)

