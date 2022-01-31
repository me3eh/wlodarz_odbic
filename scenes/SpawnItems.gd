extends Node2D

const scene = preload("res://scenes/itemDrop.tscn")

var gw = 10000
var gx = 100
var spawn_position = global_position + Vector2( 100, 0)
onready var player = get_parent().get_node("Player")
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if( weakref(player).get_ref() ):
		if spawn_position.distance_to(player.global_position) < 3000:
			spawn_walls()
	pass

func spawn_walls():
	var spawn_item_instance = scene.instance()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	add_child(spawn_item_instance)
	spawn_item_instance.global_position.y = spawn_position.y - rng.randf_range(0, 4000.0)
	spawn_item_instance.global_position.x = spawn_position.x - rng.randf_range(-380.0, 380.0)
	spawn_position.y = spawn_position.y - gw
	
#	spawn_position.x = spawn_position.x - 
	
