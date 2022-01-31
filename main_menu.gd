extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = Directory.new()
	var files = []
	var k = false
	dir.open('user://')
	dir.list_dir_begin()	
	while true:
		var file = dir.get_next()
		print( file )
		print( file == 'datastore')
		print( file == 'datastore.db')
		if file == "":
				break
		elif file == 'datastore.db':
			k = true
	dir.list_dir_end()
	
	if( k == false):
		print( dir.copy("res://datastore/datastore.db", "user://datastore.db") )
#
#	print(dir.open('user://datastore'))
##	dir.make_dir('dataStore')
##	dir.open()
##	dir.create
#	dir.list_dir_begin()
#
#	while true:
#		var file = dir.get_next()
#		if file == "":
#				break
#		elif not file.begins_with("."):
#			files.append(file)
#
#	dir.list_dir_end()
#	print(files)
#
#	dir.open('user://')
#	while true:
#		var file = dir.get_next()
#		if file == "":
#				break
#		elif not file.begins_with("."):
#			files.append(file)
#
#	dir.list_dir_end()
#	print(files)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
#	pass
func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/world.tscn")
	pass # Replace with function body.


func _on_OptionsButton_pressed():
#	get_tree()
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.
