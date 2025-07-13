extends Node2D
var screen_size = Vector2()

var player_scene = preload("res://scene/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	add_player()

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

	
	
