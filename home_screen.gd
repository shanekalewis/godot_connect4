extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_local_play_pressed():
	var gs_game = load("res://game_screen.tscn").instantiate()
	get_tree().root.add_child(gs_game)
	self.hide()
