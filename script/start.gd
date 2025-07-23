extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$start_button.connect("pressed",start)
	$close_button.connect("pressed",close)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start():
	get_tree().change_scene_to_file("res://scene/main.tscn")

func close():
	get_tree().quit()
