extends KinematicBody2D

onready var player = get_parent().get_node("Player")

var picked_up = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if global_position.y > player.global_position.y and abs(global_position.y - player.global_position.y) > 7000:
#		queue_free()
	pass
func dissapear():
	queue_free()
