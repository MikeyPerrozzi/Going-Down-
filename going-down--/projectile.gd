class_name Projectile
extends Area2D

var direction

signal projectileHit

# stats
var speed = 1
var damage = 1

static func create(direction) -> Projectile:
	
	var proj : Projectile = preload("res://projectile.tscn").instantiate()
	proj.direction = direction
	return proj

func _process(delta: float) -> void:
	pass
