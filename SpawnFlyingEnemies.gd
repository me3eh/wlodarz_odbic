extends Node2D
const FlyingEnemy = preload("res://scenes/FlyingEnemy.tscn")
const bottleEnemy = preload("res://scenes/Bottle-doubleSided.tscn")

var gw
var spawn_position = global_position + Vector2(0, -2000)
onready var player = get_parent().get_node("Player")

func _ready():
	pass

func _process(delta):
	if( weakref(player).get_ref() ):
		if spawn_position.distance_to(player.global_position) < 30000:
			spawn_walls()
	pass

func spawn_walls():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	gw = rng.randf_range(4000, 40000)
	var type_of_enemy = rng.randi_range(0, 1)
	print("typ", type_of_enemy)
	var spawn_enemy_instance = FlyingEnemy.instance()
	match(type_of_enemy):
		0:
			spawn_enemy_instance = bottleEnemy.instance()
		1:
			spawn_enemy_instance = FlyingEnemy.instance()
	add_child(spawn_enemy_instance)
	spawn_enemy_instance.global_position.y = spawn_position.y
	spawn_position.y = spawn_position.y - gw
