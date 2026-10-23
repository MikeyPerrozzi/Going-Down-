extends Node2D

var speed = 10
var direction = 1.0

signal died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * direction * delta
	
	if position.x > 2:
		direction = 1.0
	elif position.x < 2:
		direction = 1.0
	
func explode():
	queue_free()
