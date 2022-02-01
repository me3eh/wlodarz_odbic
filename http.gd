extends Node2D
var url = "https://smprojekt-338208-default-rtdb.europe-west1.firebasedatabase.app/highscore.json"
onready var top_online_highscore_label = get_parent().get_node("ColorRect").get_node("top_online_highscore_label")
onready var testing_component = false
var array = []

func _ready():
	$HTTPRequestGet.connect("request_completed", self, "_on_request_completed")
	get_into_label_5_top_highscores()

func get_into_label_5_top_highscores():
	print(url)
	var headers = ['A-IM: feed']
	var r = $HTTPRequestGet.request( url, headers )
	print( r )

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	for key in json.result:
		var keyValuePair: Array = [key, json.result[key]]
		array.append( keyValuePair )
	array.sort_custom(MyCustomSorter, "sort_ascending")
	var string_putted_in_label = 'Top global highscores:\n'
	print( array )
	for i in array.size():
		string_putted_in_label += String( i + 1 ) + ': '
		string_putted_in_label += String( array[i][0] ) + " "
		string_putted_in_label += String( array[i][1] ) + "\n"
	print( string_putted_in_label )
	var l = get_parent().get_node("ColorRect").get_node("top_online_highscore_label")
	l.text = string_putted_in_label
	testing_component = true
func get_testing_component():
	return testing_component

class MyCustomSorter:
	static func sort_ascending(a, b):
		if a[1] > b[1]:
			return true
		return false
#
#func _on_HTTPRequestPut_request_completed(result, response_code, headers, body):
#	var json = JSON.parse(body.get_string_from_utf8())
#	print( json.result )
