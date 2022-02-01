extends Line2D

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		look_at( get_global_mouse_position() )
		get_parent().get_node("testingScene").explode()
	if event is InputEventMouseMotion:
		look_at( get_global_mouse_position() )
