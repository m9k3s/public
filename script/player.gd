extends CharacterBody2D #node type important

var speed = 200 #set the speed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
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
	
	move_and_collide(velocity) #to move the object
