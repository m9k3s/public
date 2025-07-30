extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$retry.connect("pressed",retry)
	$menu.connect("pressed",menu)
	$close.connect("pressed",close)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func retry():
	get_tree().reload_current_scene()

func menu():
	get_tree().change_scene_to_file("res://scene/start.tscn")

func close():
	get_tree().quit()
