extends CharacterBody2D

@export var anim : AnimatedSprite2D
const speed = 300

func _ready() -> void:
	return

func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
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
		
	if velocity.x > 0:
		anim.flip_h = false
	else:
		anim.flip_h = true
	
	if velocity == Vector2.ZERO:
		anim.play("idle")
	
	print(position.x, position.y)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	
	move_and_slide()
