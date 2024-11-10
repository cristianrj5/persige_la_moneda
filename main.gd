extends Node

@onready var Coin = preload("res://moneda.tscn");
@export var tiempoJUego : int

var nivel := 1
var score
var time
@onready var screenSize = Vector2(450,720)
@onready var player = $jugador
@onready var hud = $hud
var playing = false

func _ready() -> void:
	randomize();
	player.ventanaTm = screenSize;
	player.hide()

func nuevoJuego():
	$spownPwer.start();
	$MonedaSonido.play();
	playing = true
	nivel = 1
	score = 0
	time = 10
	player.inicio($Marker2D.position);
	player.show();
	$Timer.start();
	agregaMonedas();
	hud.actNivel(score);
	hud.actTiempo(time);

func agregaMonedas():
	for i in range(4+nivel):
		var coin =Coin.instantiate()
		$contenedorMonedas.add_child(coin)
		coin.position = Vector2(randf_range(0,screenSize.x), randf_range(0,screenSize.y) )


func _process(delta: float) -> void:
	if playing and  $contenedorMonedas.get_child_count() == 0:
		nivel +=1;
		time += 5;
		agregaMonedas();
		


func _on_timer_timeout() -> void:
	time -= 1
	hud.actTiempo(time);
	if time <= 0 :
		gameOver();
	
		
func gameOver():
	$audioMorir.play();
	playing = false;
	$Timer.stop();
	for moneda in $contenedorMonedas.get_children():
		moneda.queue_free();
	hud.mostrar_GameOver();
	player.morir();
	
	
func _on_jugador_recolectar(recogio) -> void:
	$MonedaSonido.play();
	score += 1;
	hud.actNivel(score)
	
	
func _on_herir() -> void:
	gameOver(); 
