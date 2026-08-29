extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.player_skin == "default":
		$Sprite2D.texture = load("res://Player/Player_1.png")
	if Global.player_skin == "pumpkin":
		$Sprite2D.texture = load("res://Player/player_pumpkin.png")
