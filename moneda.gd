extends Area2D

func recoger():
	var tween = create_tween();
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(.1,.1),.5)
	tween.finished.connect(eliminarMonea)
	
func eliminarMonea():
	queue_free();
	
	
