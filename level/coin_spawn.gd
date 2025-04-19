extends Node2D

@export var coin : PackedScene #scene koin
@export var spawn_timer : Timer #timer untuk spawn koin
var is_start : bool = false #boolean untuk memeriksa apakah timer spawn koin dimulai

func _ready() -> void:
	#perintah dibawah ini di eksekusi langsung
	var coin_spawn = coin.instantiate() #instansiasi koin
	var x = randi_range(50, 650) #pilih acak posisi x dari 50 sampai 650
	var y = randi_range(50, 400) #pilih acak posisi x dari 40 sampai 400
	coin_spawn.position = Vector2(x, y) #koin akan disimpan di posisi x dan y
	add_child(coin_spawn) #tambahkan ke child coin_spawn
	
func _process(delta: float) -> void:
	if not is_start && not get_tree().get_nodes_in_group("coin"): #jika timer koin belum mulai & tidak ada node group 'koin'
		spawn_timer.start() #timer spawn koin dimulai
		is_start = true #boolean timer spawn true

func _on_coin_timer_timeout() -> void:
	var coin_spawn = coin.instantiate() #instansiasi koin
	var x = randi_range(50, 450) #pilih acak posisi x dari 50 sampai 650
	var y = randi_range(50, 700) #pilih acak posisi x dari 40 sampai 400
	coin_spawn.position = Vector2(x, y) #koin akan disimpan di posisi x dan y
	add_child(coin_spawn) #tambahkan ke child coin_spawn
	is_start = false #boolean timer spawn false
