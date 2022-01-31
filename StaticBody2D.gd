extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if( weakref(player).get_ref() ):
		if( abs( global_position.y - player.global_position.y ) > 1000 ):
			queue_free()
	pass
