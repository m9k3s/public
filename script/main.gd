extends Node2D
var screen_size = Vector2()

var player_scene = preload("res://scene/player.tscn")
var goal_scene = preload("res://scene/goal.tscn")
var enemy_scene = preload("res://scene/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	#add_player()
	add_goal()
	add_enemy()
	
	for i in range(100):
		add_enemy()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_1):
		get_tree().reload_current_scene()
	
func add_player():
	var player = player_scene.instantiate()
	var player_sprite = player.get_node("Sprite2D")
	var player_size = player_sprite.texture.get_size()
	add_child(player)
	
	player.position.x = screen_size.x/2 - player_size.x/2
	player.position.y = screen_size.y/2 - player_size.y/2

func add_goal():
	var goal = goal_scene.instantiate()
	add_child(goal)
	
	goal.position.x = random_number(0,screen_size.x)
	goal.position.y = random_number(0,screen_size.y)
	
	goal.connect("goal_crash",goal_crash)
	

func goal_crash():
	add_goal()
	add_enemy()

func add_enemy():
	var enemy = enemy_scene.instantiate()
	var spwan_location = random_spawn_location()
	enemy.spwan_location = spwan_location
	
	add_child(enemy)
	
	if spwan_location == "top":
		enemy.position.x = random_number(0,screen_size.x)
		enemy.position.y = - 50
	if spwan_location == "bot":
		enemy.position.x = random_number(0,screen_size.x)
		enemy.position.y = screen_size.y + 50
	if spwan_location == "left":
		enemy.position.x = - 50
		enemy.position.y = random_number(0,screen_size.y)
	if spwan_location == "right":
		enemy.position.x = screen_size.x + 50
		enemy.position.y = random_number(0,screen_size.y)
	
	enemy.connect("enemy_crash",enemy_crash)

func enemy_crash():
	print("enemy crash")
	add_enemy()
	
func random_number(start,end):
	var n
	var r = RandomNumberGenerator.new()
	n = r.randi_range(start,end)
	#print(n)
	return n

func random_spawn_location():
	var l = ["top","bot","left","right"]
	var s
	s = l.pick_random()
	return s
	
