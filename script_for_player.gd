extends RigidBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _physics_process(delta):

#func _input(event):
#   # Mouse in viewport coordinates.
#	if event is InputEventMouseButton:
#		#print("Mouse Click/Unclick at: ", event.position, event.position.x,' ', event.position.y)
#		var l = ( Vector2( 1024 / 2 - event.position.x, 600 / 2 - event.position.y   ) )
#		apply_central_impulse( l )
#		print ( "x", l.x )
#		print ( "y", l.y )
#		print ( "x n", l.normalized().x )
#		print ( "y n\n\n", l.normalized().y )
#		print("Viewport Resolution is: ", get_viewport_rect().size )
		
#		print('self position x ',  self.position.x)
		
	#elif event is InputEventMouseMotion:
	#	print("Mouse Motion at: ", event.position)

   # Print the size of the viewport.

var thrust = Vector2(0, -250)
var torque = 20000

#func _integrate_forces(state):
#	if Input.is_action_pressed("ui_up"):
#		applied_force = thrust.rotated(rotation)
#	else:
#		applied_force = Vector2()
#	var rotation_dir = 0
#	if Input.is_action_pressed("ui_right"):
#		rotation_dir += 10
#	if Input.is_action_pressed("ui_left"):
#		rotation_dir -= 10
#	applied_torque = rotation_dir * torque
