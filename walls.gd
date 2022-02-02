extends StaticBody2D

onready var player = get_parent().get_parent().get_node("Player")
onready var sql_node = preload("res://scenes/SQLNode.tscn").instance()

var type_of_character

func _ready():
	type_of_character = sql_node.get_character_selection()
	$left/Rock.visible = false
	$right/Rock.visible = false
	$left/Brick.visible = false
	$right/Brick.visible = false
	$left/Cheatsheet.visible = false
	$right/Cheatsheet.visible = false
	match(type_of_character):
		0:
			$left/Brick.visible = true
			$right/Brick.visible = true
		1:
			$left/Cheatsheet.visible = true
			$right/Cheatsheet.visible = true
		2:
			$left/Rock.visible = true
			$right/Rock.visible = true

func _process(delta):
	if( weakref(player).get_ref() ):
		if global_position.y > player.global_position.y and abs(global_position.y - player.global_position.y) > 7000:
			queue_free()
	pass
