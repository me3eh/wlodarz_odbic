extends Control
var sqlite = preload("res://scenes/EditHighscores.tscn")
var player_score = 0
var parent_component = null
var array_of_highscores = []
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
#		sqlite.replaceSmallestScore( $LineEdit.text, player_score)
		var httpEditRequest = preload("res://scenes/EditHighscores.tscn").instance()
		httpEditRequest.pass_score_and_component( player_score, $LineEdit.text, array_of_highscores, parent_component)
		add_child( httpEditRequest )
		visible = false

func init_component(score, component, highscores):
#	show popup, where player needs to signup their name
	visible = true
	player_score = score
	parent_component = component
	array_of_highscores = highscores

func get_top_5_highscores():
	var httpRequests = preload("res://scenes/httpGetTop5Highscores.tscn").instance()
	add_child( httpRequests )
