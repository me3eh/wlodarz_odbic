extends Node2D
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "user://datastore"
onready var label = $Label

var tableName = "Highscore"
var tabName = "CharacterChoice"

func _ready():
	pass

func replaceSmallestScore( playerName, playerScore ):
	db = SQLite.new()
	db.path = db_name	
	db.open_db()
	
	print( db.query( "update " + tableName +
	" set name='" + playerName + 
	"', score=" + String(playerScore) +
	" where id = (select min(id) from " + tableName +
	" where score= ( select min(score) from " + tableName + "));" ) )
	
	print( db.error_message)
	
	db.close_db()
func commitDataToDB():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	var dict : Dictionary = Dictionary()
	dict["name"] = "this is a test user"
	dict["score"] = 5000
	
	print( db.insert_row(tableName,dict))
	db.close_db()

func get_top_5_highscores():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	db.query("select * from " + tableName + " order by score desc;")
	
	var string_in_label = "Top local highscores:\n"
	for i in range(0, db.query_result.size()):
		string_in_label += String(i + 1) + ': ' 
		string_in_label += String(db.query_result[i]["name"])
		string_in_label += " " + String(db.query_result[i]["score"])
		string_in_label += "\n"
	db.close_db()
	return string_in_label
	
func get_minimal_score():
	
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	db.query('select min(score) from '+ tableName )
	print(  db.query_result )
	var queryResult = db.query_result[0].get( 'min(score)' )
	db.close_db()
	return queryResult
	
func get_character_selection():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	db.query("select which_character from " + tabName + " where id = 1;" )
	print( db.query_result )
	var queryResult = db.query_result[0].get( 'which_character' )
	db.close_db()
	return queryResult
func set_character_selection( player_selection ):
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	db.query("update " + tabName + " set which_character = " + String( player_selection ) + " where id = 1;" )
#	print( db.query_result )
#	var queryResult = db.query_result[0].get( 'which_character' )
	db.close_db()
#	return queryResult
	
