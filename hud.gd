extends CanvasLayer

signal inicio_juego

func actNivel(value):
	$menu/nivelLabel.text = str(value)
	
func actTiempo(value):
	$menu/tiempoLabel.text = str(value)

func mostrarMensajeInicio(text):
	$menu/inicioLabel.text = text;
	$menu/inicioLabel.show();
	$menu/mensajeTimer.start();

func _on_mensaje_timer_timeout() -> void:
	$menu/inicioLabel.hide()
	

func _on_button_pressed() -> void:
	$menu/Button.hide();
	$menu/inicioLabel.hide()
	emit_signal("inicio_juego")


func mostrar_GameOver():
	mostrarMensajeInicio("Se acabo el tiempo")
	await $menu/mensajeTimer.timeout
	$menu/Button.show()
	$menu/inicioLabel.text = "PERSIGE LA MONEDA";
	$menu/inicioLabel.show();
