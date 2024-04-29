extends Node2D


var server = null
var peer = null
var server_address = "127.0.0.1"
var server_port = 4321
var hosting = false

func create_server():
	print("creatng server...")
	server = ENetMultiplayerPeer.new()
	server.create_server(server_port, 3)

func join_server():
	print("joining server...")
	peer = ENetMultiplayerPeer.new()
	peer.create_client(server_address, server_port)
	multiplayer.multiplayer_peer = peer
	print(multiplayer.get_unique_id())

# Called when the node enters the scene tree for the first time.
func _ready():
	server_address = SceneSwitcher.get_param("server_address")
	server_port = SceneSwitcher.get_param("server_port")
	hosting = SceneSwitcher.get_param("hosting")
	
	print(server_address)
	print(server_port)
	print(hosting)
	
	if hosting:
		print("I am the host, creating server")
		create_server()
	else:
		print("I am not the host, joining server")
	join_server()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

@rpc
func print_once_per_client():
	print("I will be printed to the console once per each connected client.")
