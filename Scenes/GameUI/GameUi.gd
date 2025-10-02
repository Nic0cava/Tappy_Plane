extends Control

const GAME_OVER = preload("uid://cvw4afdciv0fi")
@onready var game_over_label: Label = $GameOver
@onready var press_space: Label = $PressSpace
@onready var timer: Timer = $Timer
@onready var score: Label = $MarginContainer/Score
@onready var sound: AudioStreamPlayer = $Sound

var _score: int = 0


func _ready() -> void:
	_score = 0

func on_point_scored() -> void:
	sound.play()
	_score += 1
	score.text = "%04d" % _score

func _process(_delta: float) -> void:
	# Exit (Escape on desktop)
	if Input.is_action_just_pressed("exit"):
		GameManager.load_main_scene()
		return

	# Start only when the "press_space" prompt is visible
	if press_space.visible and Input.is_action_just_pressed("start"):
		ScoreManager.high_score = _score
		GameManager.load_main_scene()

func _enter_tree() -> void:
	SignalHub.on_point_scored.connect(on_point_scored)
	SignalHub.on_plane_died.connect(on_plane_died)
	
func on_plane_died() -> void:
	sound.stop()
	sound.stream = GAME_OVER
	sound.play()
	game_over_label.show()
	timer.start()

func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_space.show()
