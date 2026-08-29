extends Control
var MenuScreen = "Play"
signal startgame
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("SplashScreen")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if MenuScreen == "Play":
		$Camera2D.position = Vector2(640,360)
	if MenuScreen == "Customize":
		$Camera2D.position = Vector2(640,1200)


func _on_button_pressed() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_play_button_down() -> void:
	MenuScreen = "Play"


func _on_customize_button_down() -> void:
	MenuScreen = "Customize"


func _on_start_game_button_down() -> void:
	startgame.emit()
	$AnimationPlayer.play("StartGame")
	
