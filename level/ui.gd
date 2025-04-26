extends Control

@export var player : Node2D
@export var health : Label
@export var coin : Label
var coin_pickup : int
var health_available : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		health_available = player.health
		coin_pickup = player.coin
	else:
		health_available = 0
	
	health.text = "health: " + str(health_available)
	coin.text = "coin: " + str(coin_pickup)
