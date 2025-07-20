extends Area2D

signal enemy_crash
var direction = Vector2()
var speed = 300
var sprite_size
var screen_size = Vector2()
var spwan_location
var can_check_wall
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	

	check_spwan()
	can_check_wall = false
	sprite_size = $Sprite2D.texture.get_size()
	screen_size = get_viewport_rect().size
	
	# connect to area enter and emit siginal
	connect("area_entered",crash)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2()
	if can_check_wall == false:
		if spwan_location == "top" and position.y > 16:
			can_check_wall = true
		if spwan_location == "bot" and position.y < 16:
			can_check_wall = true
		if spwan_location == "left" and position.x > 16:
			can_check_wall = true
		if spwan_location == "right" and position.x < 16:
			can_check_wall = true
	
	if can_check_wall == true:
		check_wall()
		
	velocity = direction * speed * delta
	position += velocity

func check_wall():
	if  position.x <= 0 + sprite_size.x/2 or position.x >= screen_size.x - sprite_size.x/2:
		direction.x = - direction.x
	
	if position.y <= 0 + sprite_size.y/2 or position.y >= screen_size.y - sprite_size.y/2:
		direction.y = - direction.y

func check_spwan():
	if spwan_location == "top":
		direction.x = 0
		direction.y = 1
	if spwan_location == "bot":
		direction.x = 0
		direction.y = -1
	if spwan_location == "left":
		direction.x = 1
		direction.y = 0
	if spwan_location == "right":
		direction.x = -1
		direction.y = 0

func emit_enemy_crash():
	emit_signal("enemy_crash")


func crash(s):
	if s.name == "player":
		call_deferred("emit_enemy_crash")
		queue_free()
