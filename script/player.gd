extends Area2D #node type important

var speed = 300 #set the speed
var screen_size
var player_size
var main_gui_bar_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_size = $Sprite2D.texture.get_size()
	screen_size = get_viewport_rect().size
	main_gui_bar_size = get_parent().get_node("main_gui/bar").size
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2()
	# create a new var to hold the object direction
	var direction = Vector2()
	
	if Input.is_action_pressed("w"): # check the key press using the input map
		direction.y -= 1 #minus the vector to change the direction of object 
	if Input.is_action_pressed("a"):
		direction.x -= 1
	if Input.is_action_pressed("s"):
		direction.y += 1
	if Input.is_action_pressed("d"):
		direction.x += 1
	
	direction = direction.normalized() # to make speed consistent
	velocity = direction * speed * delta # to set the velocity to direction and speed
	
	position += velocity
	position.x = clamp(position.x,player_size.x/2,screen_size.x-player_size.x/2)
	position.y = clamp(position.y,player_size.y/2+main_gui_bar_size.y,screen_size.y-player_size.y/2)
	
