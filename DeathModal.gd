extends Control
var sqlite = preload("res://scenes/SQLNode.tscn").instance()

func _ready():
	pass
	
func _on_RestartButton_pressed():
	get_tree().change_scene("res://scenes/world.tscn")
	pass


func _on_ExitButton_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")	
	pass

func activate_modal( text_for_label, playerScore ):
	$ColorRect/death_info.text = "Killed by: " + String(text_for_label)
	visible = true
	var minimal_score_from_database = sqlite.get_minimal_score()
#	print( minimal_score_from_database )
#	print( playerScore )
	var minimal_score_beaten =  minimal_score_from_database < playerScore
#	var top_5_highscores = sqlite.get_top_5_highscores()
#	print( minimal_score_beaten )
	if( minimal_score_beaten ):
		$HighscoreInput.init_component( playerScore, self )
	else:
		show_top_highscore()
func show_top_highscore():
	$ColorRect/top_highscore_label.text = sqlite.get_top_5_highscores()
