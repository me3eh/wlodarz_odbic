extends KinematicBody2D


var velocity = Vector2()
onready var player = get_parent().get_parent().get_node("Player")

func _ready():
	pass

func proces():
	velocity = Vector2()
	if( weakref(player).get_ref() ):
		if( player.global_position > global_position):
			velocity.x += 200
		else:
			velocity.x -= 200

func _process(delta):
	proces()
	velocity = move_and_slide( velocity )
	pass
