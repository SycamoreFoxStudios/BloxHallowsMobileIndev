extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("SplashScreen")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
