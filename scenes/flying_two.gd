extends KinematicBody2D

var flipped_left = true

var velocity = Vector2()
onready var player = get_parent().get_parent().get_node("Player")
onready var sql_node = preload("res://scenes/SQLNode.tscn").instance()
var type_of_character
func _ready():
	type_of_character = sql_node.get_character_selection()
	$dwoja.visible = false
	$amogus.visible = false
	$beetle.visible = false
	match(type_of_character):
		0:
			$beetle.visible = true
		1:
			$dwoja.visible = true
		2:
			$amogus.visible = true

func proces():
	velocity = Vector2()
	if( weakref(player).get_ref() ):
		if( player.global_position > global_position):
			velocity.x += 200
			if flipped_left == false:
				flipped_left = true
				$dwoja.set_flip_v( true )
				$beetle.set_flip_h( false )
				$amogus.set_flip_v( true )
		else:
			velocity.x -= 200
			if flipped_left == true:
				flipped_left = false
				$dwoja.set_flip_v( false )
				$beetle.set_flip_h( true )
				$amogus.set_flip_v( false )
				

func _process(delta):
	proces()
	velocity = move_and_slide( velocity )

func return_name_depending_on_type_of_character():
	match(type_of_character):
		0:
			return 'beetle'
		1:
			return 'dwojka'
		2:
			return 'impostor'
