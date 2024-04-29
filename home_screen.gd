extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_local_play_pressed():
	SceneSwitcher.change_scene(self, "res://game_screen.tscn")


func _on_remote_play_pressed():
	SceneSwitcher.change_scene(self, "res://multiplayer_screen.tscn")
