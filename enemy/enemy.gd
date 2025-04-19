extends Area2D


@export var anim : AnimatedSprite2D
const SPEED = 300.0

var velocity = 0
var direction = Vector2.ZERO

func _ready() -> void:
	start_moving()

func _physics_process(delta: float) -> void:
	position += velocity * delta
	#animasi enemy
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
	
	if velocity.x == 0 && velocity.y == 0:
		anim.play("idle")
	
	#flip animasi enemy jika velocity x nya kurang dari 0
	if velocity.x > 0:
		anim.flip_h = false
	else:
		anim.flip_h = true
	
func start_moving():
	var y = randf_range(-0.5, 0.5)
	var x
	if position.x == 550:
		x = -1
	else:
		x = 1
	direction += Vector2(x, y)
	velocity = direction * SPEED
