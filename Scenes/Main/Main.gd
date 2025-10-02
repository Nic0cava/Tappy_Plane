extends Control

#func _input(event: InputEvent) -> void:
	#if Input.is_action_just_pressed("start") == true:
		#print("START")
	#if event.is_action_pressed("start"):
		#print("_input:","start echo:", event.is_echo())
		#get_viewport().set_input_as_handled()
	#
	
#const GAME = preload("uid://bwf4dqilj5ml4")

@onready var high_score_label: Label = $MarginContainer/HighScoreLabel

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		GameManager.load_game_scene()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	high_score_label.text = "%04d" % ScoreManager.high_score


#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("start") == true:
		#print("START")
