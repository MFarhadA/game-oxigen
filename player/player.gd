extends CharacterBody2D

@export var anim : AnimatedSprite2D #animasi player
const speed = 300 #kecepatan berjalan
var coin : int = 0 #koin
var health : int = 0
@export var initial_health : int = 3
@export var invisible_timer : Timer
@export var hit_area : Area2D

func _ready() -> void:
	health = initial_health

func _physics_process(delta: float) -> void:
	print(health, " ", invisible_timer.time_left)
	
	var velocity = Vector2.ZERO #velocity berawal dari posisi nol
	
	#movement untuk player
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	#untuk play animasi player
	if velocity.x != 0 && velocity.y == 0:
		anim.play("move_right")
	if velocity.x == 0 && velocity.y != 0:
		if velocity.y > 0:
			anim.play("move_down")
		else:
			anim.play("move_up")
	if velocity.x != 0 && velocity.y != 0:
		if velocity.y > 0:
			anim.play("move_rightdown")
		else:
			anim.play("move_rightup")
	
	#flip animasi player jika velocity x nya kurang dari 0
	if velocity.x > 0:
		anim.flip_h = false
	else:
		anim.flip_h = true
	
	#jika diam velocitynya, maka play animasi idle
	if velocity == Vector2.ZERO:
		anim.play("idle")
	
	#movement player agar bergerak
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	
	if health == 0:
		queue_free()
	
	#untuk collission player
	move_and_slide()

	#fungsi untuk mendeteksi sesuatu
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin"): #jika nama grup area adalah 'koin'
		area.queue_free() #area/node tersebut akan dihapus
		coin += 1 #menambahkan koin

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		health -= 1
		hit_area.collision_mask = false
		invisible_timer.start()
		anim.modulate.a = 0.5
		
func _on_invisible_timer_timeout() -> void:
	hit_area.collision_mask = 1
	anim.modulate.a = 1
