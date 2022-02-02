extends Control
onready var sql_node = preload("res://scenes/SQLNode.tscn").instance()
func _ready():
	$RichTextLabel.bbcode_text = '[rainbow sat=5][center][tornado radius=11]Select your choice :D'


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")

func _on_marioButton_pressed():
	$RichTextLabel.bbcode_text = '[rainbow sat=5][center][tornado radius=11]Selected Mario'
	sql_node.set_character_selection( 0 )

func _on_studentButton_pressed():
	$RichTextLabel.bbcode_text = '[rainbow sat=5][center][tornado radius=11]Selected Student'
	sql_node.set_character_selection( 1 )

func _on_SusButton_pressed():
	$RichTextLabel.bbcode_text = '[rainbow sat=5][center][tornado radius=11]Sus amogus'
	sql_node.set_character_selection( 2 )



