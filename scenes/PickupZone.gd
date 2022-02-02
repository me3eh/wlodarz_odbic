extends Area2D
onready var player = get_parent()
func _ready():
	pass
	
func _on_PickupZone_body_entered(body):
	if "ItemAmmo" in body.get_name():
		body.dissapear()
		player.add_ammo()
	if body.is_in_group("enemy"):
		player.modal_visible( body.return_name_depending_on_type_of_character() )
	pass
#func _on_PickupZone_body_exited(body):
#	pass
