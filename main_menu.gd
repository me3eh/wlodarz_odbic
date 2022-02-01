extends Control

func _ready():
	var dir = Directory.new()
	var files = []
#	problem with initialization - with instalation, 
#sqlite file must be copied to user folder, where it could be modificated
	var datastore_exists = false
	dir.open('user://')
	dir.list_dir_begin()	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file == 'datastore.db':
			datastore_exists = true
	dir.list_dir_end()
	if( datastore_exists == false):
		print( dir.copy("res://datastore/datastore.db", "user://datastore.db") )

func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/world.tscn")


func _on_OptionsButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()
