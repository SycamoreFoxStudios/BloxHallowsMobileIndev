extends Node2D
@onready var Muzzle = $Muzzle
@onready var EjectionChamber = $EjectionChamber
const BULLET = preload("res://bullet.tscn")
var SHELL = preload("res://shell.tscn")
var playermode = ""
@onready var muzzle_flash = $Muzzleflash
signal shoot
var delay =0
var ammo = null
signal updatedammo(amount:)





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updatedammo.emit(ammo)
	look_at(GameManager.MousePos)
	global_position = $"../../RightHandMarker".global_position
	global_rotation = $"../../RightHandMarker".global_rotation
	if playermode =="shoot":
		global_position -= global_transform.y * 15
	if Input.is_action_pressed("Click") and playermode == "shoot" and delay !=1:
		if Input.is_action_just_pressed("Click") and ammo >0:
			shoot.emit()
			ammo -=1
			var shell_instance = SHELL.instantiate()
			get_tree().current_scene.add_sibling(shell_instance)
			shell_instance.global_position = EjectionChamber.global_position
			shell_instance.global_rotation = EjectionChamber.global_rotation
			var bullet_instance = BULLET.instantiate()
			get_tree().root.add_child(bullet_instance)
			bullet_instance.global_position = Muzzle.global_position
			bullet_instance.global_rotation = Muzzle.global_rotation
			muzzle_flash.global_position =Muzzle.global_position 
			muzzle_flash.rotation = randf_range(0, TAU)
			muzzle_flash.visible = true
			delay =1
			await get_tree().create_timer(0.2).timeout
			muzzle_flash.visible = false
			delay=0
			
			
