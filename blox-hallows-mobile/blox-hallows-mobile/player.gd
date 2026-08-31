extends CharacterBody2D

@export var speed : float = 300

@export var joystick_left : VirtualJoystick

@export var joystick_right : VirtualJoystick

var move_vector := Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.player_skin == "default":
		$Sprite2D.texture = load("res://Player/Player_1.png")
	if Global.player_skin == "pumpkin":
		$Sprite2D.texture = load("res://Player/player_pumpkin.png")
		
		
	# Movement code
	move_vector = Vector2.ZERO
	move_vector = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	position += move_vector * speed * delta
	
	# Rotation:
	if joystick_right and joystick_right.is_pressed:
		rotation = joystick_right.output.angle()
