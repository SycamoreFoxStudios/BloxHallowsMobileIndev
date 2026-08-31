extends Control
var MenuScreen = "Play"
signal startgame
var opening_played = "no"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var size = get_viewport().get_visible_rect().size
	if size.x > size.y:
		$"Rotation Warning".visible = false
		if opening_played == "no":
			$AnimationPlayer.play("SplashScreen")
			opening_played ="yes"
	else:
		$"Rotation Warning".visible = true
	
	
	
	
	
	
	
	
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
	get_tree().change_scene_to_file("res://gameplay.tscn")
	


func _on_item_list_item_selected(index: int) -> void:
	var item_name = $ItemList.get_item_text(index)
	if item_name == "Default":
		Global.player_skin = "default"
	if item_name == "Pumpkin":
		Global.player_skin = "pumpkin"
