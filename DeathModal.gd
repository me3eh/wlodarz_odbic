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
	
	if( minimal_score_from_database < playerScore ):
#		init component and show_top_highscore() ;)
		$HighscoreInput.init_component( playerScore, self )
	else:
		show_top_local_highscore()

	check_if_beat_highscore_and_if_so_activate_modal( playerScore )
#	

func show_top_local_highscore():
	$ColorRect/top_highscore_label.text = sqlite.get_top_5_highscores()
	
func show_top_global_highscore():
#	by creating and adding a node as a child, we execute the code in _ready function
	var httpGetRequest = preload("res://scenes/httpGetTop5Highscores.tscn").instance()
	add_child( httpGetRequest )

func check_if_beat_highscore_and_if_so_activate_modal( playerScore ):
#	by creating and adding a node as a child, we execute the code in _ready function
	var httpCheckIfBeatHighscore = preload("res://scenes/httpActivateInputOnlineTable.tscn").instance()
	add_child( httpCheckIfBeatHighscore )
#	initialization for additional arguments for httpActivateInputOnlineTable node
	httpCheckIfBeatHighscore.pass_score_and_component( playerScore, self, $HighscoreOnlineInput )
