extends Node2D
var url = "https://smprojekt-338208-default-rtdb.europe-west1.firebasedatabase.app/highscore.json"
var array = []
var parent_component = null
var player_score = 0
var input_for_online_highscore_component = null

func _ready():
	$HTTPRequestGet.connect("request_completed", self, "_on_request_completed")
	var headers = ['A-IM: feed']
	var r = $HTTPRequestGet.request( url, headers )

func _on_HTTPRequestGet_request_completed(result, response_code, headers, body):
	array.clear()
	if( !body.empty() ):
		var json = JSON.parse(body.get_string_from_utf8())
		for key in json.result:
			var keyValuePair: Array = [key, json.result[key]]
			array.append( keyValuePair )
		array.sort_custom(MyCustomSorter, "sort_ascending")
		if( int( array[ array.size() - 1 ][1] ) < player_score ):
			input_for_online_highscore_component.init_component( player_score, parent_component, array )
		else:
			parent_component.show_top_global_highscore()

class MyCustomSorter:
	static func sort_ascending(a, b):
		if a[1] > b[1]:
			return true
		return false

func pass_score_and_component( play_score, component, input_for_online_component):
	print('W http sprawdzajacym')
	parent_component = component
	print(parent_component)
	player_score = play_score
	
	print(player_score)
	input_for_online_highscore_component = input_for_online_component
	print(input_for_online_component)
