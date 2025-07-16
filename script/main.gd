extends Node2D
var screen_size = Vector2()

var player_scene = preload("res://scene/player.tscn")
var goal_scene = preload("res://scene/goal.tscn")
var enemy_scene = preload("res://scene/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	add_player()
	add_goal()
	add_enemy()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
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
	print("crash")
	add_goal()

func add_enemy():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)

func random_number(start,end):
	var n
	var r = RandomNumberGenerator.new()
	n = r.randi_range(start,end)
	print(n)
	return n
