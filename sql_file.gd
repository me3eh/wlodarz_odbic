extends Node2D
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "user://datastore"
onready var label = $Label

var tableName = "Highscore"

func _ready():	
	pass

func replaceSmallestScore( playerName, playerScore ):
#	copy_from_res()	
	db = SQLite.new()
	db.path = db_name	
	db.open_db()
	
	print( db.query( "update " + tableName +
	" set name='" + playerName + 
	"', score=" + String(playerScore) +
	" where id = (select min(id) from " + tableName +
	" where score= ( select min(score) from " + tableName + "));" ) )
	
	print( db.error_message)
#	db.commit()
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
	
	var k = "Top highscores:\n"
	for i in range(0, db.query_result.size()):
		k += String(i + 1) + ': ' 
		k += String(db.query_result[i]["name"])
		k += " " + String(db.query_result[i]["score"])
		k += "\n"
	db.close_db()
	return k
	
func get_minimal_score():
	
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	db.query('select min(score) from '+ tableName )
	print(  db.query_result )
	var queryResult = db.query_result[0].get( 'min(score)' )
	db.close_db()
	return queryResult
	
func _process(delta):
	pass
#func copy_from_res():
#	var dir = Directory.new()
#	var files = []
#	print( dir.remove("res://datastore/datastore.db") )	
#	print( dir.copy("user://datastore.db", "res://datastore/datastore.db") )
