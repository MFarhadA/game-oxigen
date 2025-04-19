extends Node2D

@export var enemy : PackedScene #scene koin
@export var spawn_timer : Timer #timer untuk spawn koin
var is_start : bool = false #boolean untuk memeriksa apakah timer spawn koin dimulai

func _ready() -> void:
	return
	
func _on_enemy_timer_timeout() -> void:
	var enemy_spawn = enemy.instantiate() #instansiasi koin
	var x = [-50, 550].pick_random() #pilih acak posisi x dari 50 sampai 650
	var y = randi_range(50, 700) #pilih acak posisi x dari 40 sampai 400
	enemy_spawn.position = Vector2(x, y) #koin akan disimpan di posisi x dan y
	add_child(enemy_spawn) #tambahkan ke child coin_spawn
