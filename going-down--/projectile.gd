class_name Projectile
extends Area2D

var direction
@onready var fist_bullet: Sprite2D = $FistBullet

signal projectileHit

# stats
var speed = 150
var damage = 1

static func create(direction) -> Projectile:
	
	var proj : Projectile = preload("res://projectile.tscn").instantiate()
	proj.direction = direction
	return proj

func _ready() -> void:
	fist_bullet.rotation = Vector2.UP.angle_to(direction)

func _process(delta: float) -> void:
	position += speed * direction * delta
	
func _on_area_entered(area):
	if area.is_in_group("enemies"):
		area.explode()
		queue_free()
	
	

	
