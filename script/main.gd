extends Node2D
var screen_size = Vector2()

var player_scene = preload("res://scene/player.tscn")
var goal_scene = preload("res://scene/goal.tscn")
var enemy_scene = preload("res://scene/enemy.tscn")

var goal_spwan_gap = Vector2(100,100)

var player_life
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	add_player()
	add_goal()
	add_enemy()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_1):
		get_tree().reload_current_scene()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	
func add_player():
	var player = player_scene.instantiate()
	var player_sprite = player.get_node("Sprite2D")
	var player_size = player_sprite.texture.get_size()
	add_child(player)
	
	player.position.x = screen_size.x/2 - player_size.x/2
	player.position.y = screen_size.y/2 - player_size.y/2

func add_goal():
	var goal = goal_scene.instantiate()
	var goal_sprite = goal.get_node("Sprite2D")
	var goal_size = goal_sprite.texture.get_size()
	add_child(goal)
	
	goal.position.x = random_number(goal_size.x/2+goal_spwan_gap.x,screen_size.x-goal_size.x/2-goal_spwan_gap.x)
	goal.position.y = random_number(goal_size.y/2+goal_spwan_gap.y,screen_size.y-goal_size.y/2-goal_spwan_gap.y)
	
	goal.connect("goal_crash",goal_crash)
	#print(goal_size)

func goal_crash():
	add_goal()
	add_enemy()

func add_enemy():
	var enemy = enemy_scene.instantiate()
	var spwan_location = random_spawn_location()
	enemy.spwan_location = spwan_location
	
	add_child(enemy)
	
	if spwan_location == "top":
		enemy.position.x = random_number(32/2,screen_size.x-32/2)
		enemy.position.y = 32/2
	if spwan_location == "bot":
		enemy.position.x = random_number(32/2,screen_size.x-32/2)
		enemy.position.y = screen_size.y - 32/2
	if spwan_location == "left":
		enemy.position.x = 32/2
		enemy.position.y = random_number(32/2,screen_size.y-32/2)
	if spwan_location == "right":
		enemy.position.x = screen_size.x - 32/2
		enemy.position.y = random_number(32/2,screen_size.y-32/2)
	
	enemy.connect("enemy_crash",enemy_crash)

func enemy_crash():
	$player.queue_free()
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
	
