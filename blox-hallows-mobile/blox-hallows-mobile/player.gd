extends CharacterBody2D

const SPEED = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.player_skin == "default":
		$Sprite2D.texture = load("res://Player/Player_1.png")
	if Global.player_skin == "pumpkin":
		$Sprite2D.texture = load("res://Player/player_pumpkin.png")
	
	
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	
	var lookdirection = Input.get_vector("lookleft", "lookright", "lookup", "lookdown")
	if lookdirection:
		rotation = lookdirection.angle()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
