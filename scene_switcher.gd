# scene_switcher.gd
extends Node

# Private variable
var _params = null

# Call this instead to be able to provide arguments to the next scene
func change_scene(old_scene, next_scene, params=null):
	_params = params
	var gs_game = load(next_scene).instantiate()
	get_tree().root.add_child(gs_game)
	old_scene.queue_free()

# In the newly opened scene, you can get the parameters by name
func get_param(param_name):
	if _params != null and _params.has(param_name):
		return _params[param_name]
	return null
