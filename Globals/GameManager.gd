extends Node


const GAME = preload("uid://bwf4dqilj5ml4")
const MAIN = preload("uid://cxt5x3kdbarw8")
const SIMPLE_TRANSITION = preload("uid://dmdvs4ca03gbh")
const COMPLEX_TRANSITION = preload("uid://b50athuial6mr")

var next_scene: PackedScene

func add_complex() -> void:
	var ct = COMPLEX_TRANSITION.instantiate()
	add_child(ct)

func load_game_scene() -> void:
	next_scene = GAME
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
	
	
func load_main_scene() -> void:
	next_scene = MAIN
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
