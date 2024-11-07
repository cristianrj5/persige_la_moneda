extends Area2D

@export var velocidad : int
var movimiento := Vector2()
var ventanaTm = Vector2(430, 720)

signal recolectar
signal herir

@onready var sprite : AnimatedSprite2D= $AnimatedSprite2D; ##se debe hacer el llamado de el animatedsptrite y ponerle su mismo tipo

func _ready() -> void:
	area_entered.connect(_on_area_jugador)

func _process(delta: float) -> void:
	obtenerMovimiento(delta)
	if movimiento.length() > 0:
		sprite.animation = "correr"
		if movimiento.x != 0:
			sprite.flip_h = movimiento.x < 0; 
	else: sprite.animation = "zorrito";

func obtenerMovimiento(delta):
	movimiento.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	movimiento.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	position += movimiento.normalized() * velocidad * delta
	position.x = clamp(position.x , 20, ventanaTm.x);
	position.y = clamp(position.y , 100, ventanaTm.y);
	
func inicio(valor):
	position= valor;
	sprite.play("zorrito");
	set_process(true);
	
func morir():
	sprite.play("herido");
	set_process(false);
	
func _on_area_jugador(area: Area2D) -> void:
	if area.is_in_group("monedas"):
		area.recoger();
		emit_signal("recolectar");
	if area.is_in_group("enemigos"):
		emit_signal("herir");
		morir();
