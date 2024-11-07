extends Node

@onready var Coin = preload("res://moneda.tscn")
@export var tiempoJUego : int

var nivel := 1
var score
var time
@onready var screenSize = Vector2(450,720)
var playing = false

func _ready() -> void:
	agregaMonedas()

func agregaMonedas():
	for i in range(4+nivel):
		var coin =Coin.instantiate()
		$contenedorMonedas.add_child(coin)
		coin.position = Vector2(randf_range(0,screenSize.x), randf_range(0,screenSize.y) )
