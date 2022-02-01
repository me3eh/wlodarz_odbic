extends Node2D
var array_of_highscores = []
var player_score = ''
var player_name = ''
var parent_component = null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var url = "https://smprojekt-338208-default-rtdb.europe-west1.firebasedatabase.app/highscore.json"

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequestPut.connect("request_completed", self, "_on_request_completed")
	save_new_highscores_into_database()
	
func _on_HTTPRequestPut_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print( json.result )
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func pass_score_and_component( play_score, name, highscores, component):
	player_score = play_score
	player_name = name
	array_of_highscores = highscores
	parent_component = component

func save_new_highscores_into_database():
	print('less go')
	print( array_of_highscores )
#	array_of_highscores[array_of_highscores.size() - 1][0] = player_name
#	array_of_highscores[array_of_highscores.size() - 1][1] = player_score
	print( array_of_highscores )
	var dict : Dictionary = Dictionary()
	dict[player_name] = player_score
	
	for i in array_of_highscores.size() - 1:
		dict[array_of_highscores[i][0]] = array_of_highscores[i][1]
#	var body := { "Lmao" : 5400, "hihi" : 40, "kekw" : 11, "lll" : 20134, "prapap" : 200 }
#	var query = JSON.print(body)
	var headers = ["Content-Type: application/json"]
	var error = $HTTPRequestPut.request( url, headers, true, HTTPClient.METHOD_PUT, to_json( dict ) )
	print( error )
	print( 'wyprintowalo')
	print( parent_component)
	parent_component.show_top_global_highscore()
#$HTTPRequestPut.request("https://smprojekt-338208-default-rtdb.europe-west1.firebasedatabase.app/highscore.json", ["Content-Length: " + String( body.size() - 1 ) ], false, HTTPClient.METHOD_PUT, to_json(body) )
