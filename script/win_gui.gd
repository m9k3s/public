extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$play.connect("pressed",play)
	$menu.connect("pressed",menu)
	$quit.connect("pressed",quit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play():
	get_tree().reload_current_scene()
	
func menu():
	get_tree().change_scene_to_file("res://scene/start.tscn")

func quit():
	get_tree().quit()
