extends RigidBody2D
var initial_height = 0
var high_score = 0
var first_score_label = false
var first_ammo_label = false

var score_label_default = ''
var ammo_label_default = ''
onready var score_label = get_parent().get_node("Camera").get_children()[0]
onready var ammo_label = get_parent().get_node("Camera").get_children()[1]
onready var modal = get_parent().get_node("Camera").get_node('death_modal')
onready var ammo_amount = 10
onready var timer = get_node("Timer")
onready var kinematic_power = 100000

func _ready():
	initial_height = global_position.y
	high_score = initial_height
	timer.set_wait_time(5)
	timer.start()
	pass

func _input(event):
	var player_position_within_camera = get_global_transform_with_canvas().origin
	if event is InputEventMouseButton:
		if event.is_pressed():
			timer.start()
			if ammo_amount > 0:
				var force = ( -Vector2( get_global_mouse_position() - global_position).normalized() )
				var forces_from_knockback = ( force * kinematic_power)
				ammo_used()
				apply_central_impulse( forces_from_knockback )

func _process(delta):
	var score_at_the_moment = initial_height - global_position.y
	if( score_at_the_moment > high_score ):
		high_score = score_at_the_moment
		score_label.text = "SCORE:" + String( floor( high_score / 100 ) )
	if( high_score - score_at_the_moment > 3000  ):
		modal_visible( " Fell down :( ")
	if( timer.get_time_left() <= 1 && ammo_amount == 0 ):
		modal_visible( "No ammo")
	pass

func ammo_used():
	ammo_amount -= 1
	ammo_label.text = ":" + String(ammo_amount)
	
func add_ammo():
	ammo_amount += 10
	ammo_label.text = ":" + String(ammo_amount)
	
func modal_visible( death_info ):
	queue_free()
	modal.activate_modal( death_info, floor( high_score / 100 ) )

