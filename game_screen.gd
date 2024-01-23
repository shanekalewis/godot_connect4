extends Node2D

var turn = true
# PLAYING, RESULTS
var STATE = "PLAYING"

var tokens = [
	preload("res://UI/red_token.png"),
	preload("res://UI/yellow_token.png")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_next_token(col):
	var grid = get_node("grid")
	var color = "yellow"
	
	if turn == true:
		color = "red"
		
	var res = grid.add_token(col, color)
	if res == -1:
		return
	turn = not turn
	var player_turn = get_node("player_turn")
	if turn == true:
		player_turn.texture = tokens[1]
	else:
		player_turn.texture = tokens[0]
	check_game()	

func check_game():
	var grid = get_node("grid")
	print(grid.check_winner())

func _on_column_1_pressed():
	add_next_token(0)
	
func _on_column_2_pressed():
	add_next_token(1)

func _on_column_3_pressed():
	add_next_token(2)

func _on_column_4_pressed():
	add_next_token(3)

func _on_column_5_pressed():
	add_next_token(4)

func _on_column_6_pressed():
	add_next_token(5)

func _on_column_7_pressed():
	add_next_token(6)
