extends CharacterBody2D

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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
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
	var collide = move_and_collide(velocity)
	if collide:
		if collide.get_collider().name == "player":
			queue_free()

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
