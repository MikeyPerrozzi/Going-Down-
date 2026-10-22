extends CharacterBody2D




const SPEED = 150.0
const JUMP_VELOCITY = -350.0

var direction_input := Vector2.ZERO

# Reference to sprite
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	direction_input = Input.get_vector("move_left", "move_right","move_up","move_down").normalized()
	if Input.is_action_just_pressed("shoot"):
		create_proj()

func _physics_process(delta: float) -> void:
	
	# Input for player character
	var direction := Input.get_axis("move_left", "move_right")
	# could maybe try adding a way to have 
	# upper/lower direction as separate variables
	
	# Flipping player character
	if direction > 0:
		animated_sprite.flip_h = true
	elif direction < 0:
		animated_sprite.flip_h = false
	
	# Different Anims
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	# Player movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#TEST
	
	velocity = direction_input * SPEED
	
	move_and_slide()


func create_proj():
	var bulletDirection = position.direction_to(get_global_mouse_position())
	
	var bullet = Projectile.create(bulletDirection)
	get_parent().add_child(bullet)
	bullet.position = position
	print(position)
	
