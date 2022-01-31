extends StaticBody2D

onready var player = get_parent().get_parent().get_node("Player")

func _ready():
	pass

func _process(delta):
	if( weakref(player).get_ref() ):
		if global_position.y > player.global_position.y and abs(global_position.y - player.global_position.y) > 7000:
			queue_free()
	pass
