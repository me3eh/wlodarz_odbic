extends Camera2D
onready var body = get_parent().get_node("Player")

func _ready():
	pass # Replace with function body.


func _process(delta):
#	print(body.global_position)
	if( weakref(body).get_ref() ):
		if global_position.y > body.global_position.y:
			global_position.y = body.global_position.y
	pass
