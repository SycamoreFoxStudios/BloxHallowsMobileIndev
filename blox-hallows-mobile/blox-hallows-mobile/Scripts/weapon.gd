extends Node2D
const BULLET = preload("res://Scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.shoot.connect(shoot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Weapon Configuration
	if Global.weapon_type == "pistol":
		Global.full_auto = false
		$Sprite2D.texture = load("res://Weapons/pistol_single.png")
		$Barrel.position = Vector2(20,-2.5)
		$EjectionMarker.position = Vector2(-5,0)
	
	
#Bullet Creation
func shoot() -> void:
	var bullet_instance = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = $Barrel.global_position
	bullet_instance.global_rotation = $Barrel.global_rotation
