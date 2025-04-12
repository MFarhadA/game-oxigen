extends Node2D

@export var coin : PackedScene
@export var spawn_timer : Timer
var is_start : bool = false

func _ready() -> void:
	var coin_spawn = coin.instantiate()
	var x = randi_range(50, 650)
	var y = randi_range(50, 400)
	coin_spawn.position = Vector2(x, y)
	add_child(coin_spawn)
	print(coin_spawn.position)
	
func _process(delta: float) -> void:
	if not is_start && not get_tree().get_nodes_in_group("coin"):
		spawn_timer.start()
		is_start = true

func _on_coin_timer_timeout() -> void:
	var coin_spawn = coin.instantiate()
	var x = randi_range(50, 650)
	var y = randi_range(50, 400)
	coin_spawn.position = Vector2(x, y)
	add_child(coin_spawn)
	is_start = false
