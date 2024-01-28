extends Node2D

var turn = true
# PLAYING, RESULTS
var STATE = "PLAYING"

var tokens = [
	preload("res://UI/red_token.png"),
	preload("res://UI/yellow_token.png")
]

var buttons = [
	"column1",
	"column2",
	"column3",
	"column4",
	"column5",
	"column6",
	"column7",
]

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_win_info()
	show_col_buttons()

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
	var winner = grid.check_winner()
	
	if winner == "yellow":
		print("yellow wins!")
		hide_col_buttons()
		show_win_info(winner)
	elif winner == "red":
		print("red wins!")
		hide_col_buttons()
		show_win_info(winner)

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

func hide_col_buttons():
	for col in buttons:
		get_node(col).hide()
		
func show_col_buttons():
	for col in buttons:
		get_node(col).show()

func hide_win_info():
	get_node("exit").hide()
	get_node("play_again").hide()
	get_node("winning_player").hide()
	
func show_win_info(winner):
	get_node("exit").show()
	get_node("play_again").show()
	get_node("winning_player").text = "Player " + winner + " wins!"
	get_node("winning_player").show()

func _on_play_again_pressed():
	var gs_game = load("res://game_screen.tscn").instantiate()
	get_tree().root.add_child(gs_game)
	self.hide()


func _on_exit_pressed():
	var gs_game = load("res://home_screen.tscn").instantiate()
	get_tree().root.add_child(gs_game)
	self.hide()
