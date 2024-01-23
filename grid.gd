extends Node2D

var width = 7
var height = 6
var x_start = 296
var y_start = 720

var sprite_locations = []

# game_grid[row][column]
var game_grid = []

var possible_peices = [
	preload("res://UI/empty_token.png"),
	preload("res://UI/red_token.png"),
	preload("res://UI/yellow_token.png")
]

func print_game_grid():
	for i in game_grid:
		print(i)
	print("\n")

# Called when the node enters the scene tree for the first time.
func _ready():
	game_grid = make_2d_array()
	#print("Game grid")
	#print_game_grid()

func make_2d_array():
	var arr = []
	var curr_width = x_start
	# for every row create column
	for i in width:
		var curr_height = y_start
		arr.append([])
		#sprite_locations.append([])
		for j in height:
			var sprite = Sprite2D.new()
			sprite.texture = possible_peices[0]
			sprite.z_index = 1
			sprite.position = Vector2(curr_width, curr_height)
			arr[i].append(sprite)
			self.add_child(sprite)
			curr_height -= 92.5
		curr_width += 93.10
	return arr

func get_next_space(col):
	for i in range(height):
		#print(game_grid[col][i].texture)
		if game_grid[col][i].texture == possible_peices[0]:
			return i
	return -1

func add_token(col, color):
	var next_idx = get_next_space(col)
	if next_idx == -1:
		print("error!")
		return -1
	if color == "yellow":
		game_grid[col][next_idx].texture = possible_peices[1]
	else:
		game_grid[col][next_idx].texture = possible_peices[2]		

func foundConnect4(color):
	# check horizontal
	#print("Horizontal")
	for row in range(width-3):
		#print("Row: ", row)
		for i in range(height):
			#print("Column start: ", i)
			#print("Check: ", game_grid[row][i]," ",  game_grid[row+1][i]," ",  game_grid[row+2][i]," ", game_grid[row+3][i])
			if game_grid[row][i].texture == color && \
			game_grid[row+1][i].texture == color && \
			game_grid[row+2][i].texture == color && \
			game_grid[row+3][i].texture == color:
				return true
	
	# check veritical
	#print("Vertical")
	for row in width:
		#print("Row: ", row)
		for i in range(height-3):
			#print("Column start: ", i)
			#print("Check: ", game_grid[row][i]," ",  game_grid[row][i+1]," ",  game_grid[row][i+2]," ", game_grid[row][i+3])
			if game_grid[row][i].texture == color && \
			game_grid[row][i+1].texture == color && \
			game_grid[row][i+2].texture == color && \
			game_grid[row][i+3].texture == color:
				return true
	
	# ascending diagonal check
	#print("Ascending diagonal")
	for row in range(width-3):
		for i in range(height-3):
			#print("Check: ", game_grid[row][i]," ",  game_grid[row+1][i+1]," ",  game_grid[row+2][i+2]," ", game_grid[row+3][i+3])
			if game_grid[row][i].texture == color && \
			game_grid[row+1][i+1].texture == color && \
			game_grid[row+2][i+2].texture == color && \
			game_grid[row+3][i+3].texture == color:
				return true
				
	# descending diagonal check
	#print("Descending diagonal")
	for row in range(width-1, 2, -1):
		#print("Row: ", row)
		for i in range(height-1, 2, -1):
			#print("Row: ", row, " Col: ", i)
			#print("Check: ", game_grid[row][i]," ",  game_grid[row-1][i-1]," ",  game_grid[row-2][i-2]," ", game_grid[row-3][i-3])
			if game_grid[row][i].texture == color && \
			game_grid[row-1][i-1].texture == color && \
			game_grid[row-2][i-2].texture == color && \
			game_grid[row-3][i-3].texture == color:
				return true
	
	return false

func check_winner():
	#print_game_grid()
	if foundConnect4(possible_peices[2]) == true:
		return "yellow"
	elif foundConnect4(possible_peices[1]) == true:
		return "red"
	return "none"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
