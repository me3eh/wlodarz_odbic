extends Area2D

var gun_at_body : Dictionary = Dictionary()

func _on_gun_area_body_entered(body):
	gun_at_body[body] = body

func _on_gun_area_body_exited(body):
	gun_at_body.erase( body )	

func _input(event):
	if event is InputEventMouseButton && gun_at_body != null:
		if event.is_pressed():
			for i in gun_at_body.keys():
				var object = gun_at_body[i]
				gun_at_body.erase( i )
				object.queue_free()
