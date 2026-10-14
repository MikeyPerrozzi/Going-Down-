extends CharacterBody2D




const SPEED = 150.0
const JUMP_VELOCITY = -350.0

	

# Reference to sprite
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# Input for player character
	var direction := Input.get_axis("move_left", "move_right")
	# could maybe try adding a way to have 
	# upper/lower direction as separate variables
	
	# Flipping player character
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
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
	#var direction = Input.get_vector("move_left", "move_right","move_up","move_down")
	#velocity = direction * SPEED
	
		
	move_and_slide()
