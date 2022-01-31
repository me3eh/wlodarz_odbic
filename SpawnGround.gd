extends Node2D
const scene = preload("res://scenes/walls.tscn")
var gw = 850
var spawn_position = global_position
onready var player = get_parent().get_node("Player")
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if( weakref(player).get_ref() ):
		if spawn_position.distance_to(player.global_position) < 30000:
			spawn_walls()
	pass

func spawn_walls():
	var spawn_wall_instance = scene.instance()
	add_child(spawn_wall_instance)
	spawn_wall_instance.global_position.y = spawn_position.y
	spawn_position.y = spawn_position.y - gw
