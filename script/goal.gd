extends Area2D
signal goal_crash

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered",crash)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func crash(e):
	print(e)
	emit_signal("goal_crash")
	queue_free()
