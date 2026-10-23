extends Node

var score = 0

@onready var label: Label = $Label


func add_score():
	score += 1
	label.text = "Score: " + str(score) 
	
