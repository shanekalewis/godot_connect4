extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("error").hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func validate_multiplayer_inputs(is_hosting:bool):
	var err_node = get_node("error")
	var port = get_node("server_port_input").text
	if port == "":
		err_node.text = "Error! Server port required"
		err_node.show()
		return null
	port = int(port)
	var params = {
		"server_address": get_node("server_address_input").text,
		"server_port": port,
		"hosting": is_hosting
	}
	
	if params["server_address"] == "":
		err_node.text = "Error! Server address required when hosting game"
		err_node.show()
		return null
	return params

func _on_create_pressed():
	var params = validate_multiplayer_inputs(true)
	if params:
		print(params)
		SceneSwitcher.change_scene(self, "res://lobby.tscn", params)
	

# TODO: Create server list
func _on_join_pressed():
	var params = validate_multiplayer_inputs(false)
	if params:
		print(params)
		SceneSwitcher.change_scene(self, "res://lobby.tscn", params)


func _on_exit_pressed():
	SceneSwitcher.change_scene(self, "res://home_screen.tscn")
