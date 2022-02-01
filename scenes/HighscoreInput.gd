extends Control
var sqlite = preload("res://scenes/SQLNode.tscn").instance()
var player_score = 0
var initiating_component = null
func _ready():
	pass

func _input(event):
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			OS.hide_virtual_keyboard()

func _on_Button_pressed():
	if( $LineEdit.text == '' ):
		$Label.text = 'Input field cannot be empty'
	else:
		sqlite.replaceSmallestScore( $LineEdit.text, player_score)
		visible = false
		if(initiating_component != null):
			initiating_component.show_top_local_highscore()

func init_component(score, component):
#	show popup, where player needs to signup their name
	visible = true
	player_score = score
	initiating_component = component
