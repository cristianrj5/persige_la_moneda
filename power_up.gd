extends Area2D

func recogerPoder():
	var tween = create_tween();
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(.1,.1),.5)
	tween.finished.connect(eliminarMoneda)
	
func eliminarMoneda():
	queue_free();
	

#func _on_power_timer_timeout() -> void:
	#eliminarMoneda();
