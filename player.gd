extends Area2D

@export var velocidad : int
@export var vlocity : int
var movimiento := Vector2()
var ventanaTm = Vector2(480, 720)

func _process(delta: float) -> void:
	obtenerMovimiento()
	position += movimiento * delta


func obtenerMovimiento():
	movimiento = Vector2()
	if Input.is_action_pressed("ui_left"):
		movimiento.x -=1
	
	movimiento = velocidad * movimiento.normalized()
	
	
