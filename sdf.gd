extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _input(event):
	if event is InputEventMouseButton:
		look_at( get_global_mouse_position() )
	if event is InputEventMouseMotion:
#		print("player", player_position_within_camera)
#		print("event", event.position)
#		look_at( -event.position)
#		look_at( event.position - (get_viewport_rect().position / 2) )
		look_at( get_global_mouse_position() )	
#		look_at( event.position - (get_viewport_rect().position / 2) + get_global_mouse_position())
#		print("lokalna", event.position)
#		print("globalne", get_global_mouse_position())
		
#		print("mouse", Vector2( player_position_within_camera.x - event.position.x,
#			player_position_within_camera.y - event.position.y ).normalized() )
#		print( camera.get_camera_screen_center() )
#		print( event.global_position )
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
