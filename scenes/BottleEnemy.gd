extends KinematicBody2D

onready var sql_node = preload("res://scenes/SQLNode.tscn").instance()
var type_of_character
func _ready():
	type_of_character = sql_node.get_character_selection()
	$knife.visible = false
	$spikeball.visible = false
	$bottle.visible = false
	match(type_of_character):
		0:
			$spikeball.visible = true
		1:
			$bottle.visible = true
		2:
			$knife.visible = true

func return_name_depending_on_type_of_character():
	match(type_of_character):
		0:
			return 'spikeball'
		1:
			return 'bottle'
		2:
			return 'knife'
