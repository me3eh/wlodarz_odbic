extends RigidBody2D
var initial_height = 0
var high_score = 0
var additional_points_from_eliminations = 0
var first_score_label = false
var first_ammo_label = false
var highest_at_the_moment = 0
var type_of_character = 0
var score_label_default = ''
var ammo_label_default = ''
onready var sql_node = preload("res://scenes/SQLNode.tscn").instance()
onready var score_label = get_parent().get_node("Camera").get_children()[0]
onready var ammo_label = get_parent().get_node("Camera").get_children()[1]
onready var modal = get_parent().get_node("Camera").get_node('death_modal')
onready var ammo_amount = 10
onready var timer = get_node("Timer")
onready var kinematic_power = 100000

func _ready():
	type_of_character = sql_node.get_character_selection()
	$Body/Amogus.visible = false
	$Body/student.visible = false
	$Body/Mario.visible = false
	match(type_of_character):
		0:
			$Body/Mario.visible = true
		1:
			$Body/student.visible = true
		2:
			$Body/Amogus.visible = true
	
	initial_height = global_position.y
	high_score = initial_height
	timer.set_wait_time(5)
	timer.start()

func _input(event):
	var player_position_within_camera = get_global_transform_with_canvas().origin
	if event is InputEventMouseButton:
		if event.is_pressed():
			if ammo_amount > 0:
				timer.start()
				var force = ( -Vector2( get_global_mouse_position() - global_position).normalized() )
				var forces_from_knockback = ( force * kinematic_power)
				ammo_used()
				apply_central_impulse( forces_from_knockback )
	
func _process(delta):
	var actual_height = initial_height - global_position.y
	if highest_at_the_moment < actual_height:
		highest_at_the_moment = actual_height;
	var score_at_the_moment = floor( ( actual_height ) / 100 )
	var score_overall = score_at_the_moment + additional_points_from_eliminations
	if( score_overall > high_score ):
		high_score = score_overall
		score_label.text = "SCORE:" + String( high_score )
	if( highest_at_the_moment - actual_height > 2500  ):
		modal_visible( " Fell down :( ")
	if( timer.get_time_left() <= 1 && ammo_amount == 0 ):
		modal_visible( "No ammo")
#	print( Input.get_gyroscope() )
	

func ammo_used():
	ammo_amount -= 1
	ammo_label.text = ":" + String(ammo_amount)
	
func add_ammo():
	ammo_amount += 10
	additional_points_from_eliminations += 10
	ammo_label.text = ":" + String(ammo_amount)
	
func modal_visible( death_info ):
	queue_free()
	modal.activate_modal( death_info, high_score )

func add_points_from_elimination():
	additional_points_from_eliminations += 20
	print( "added points")
