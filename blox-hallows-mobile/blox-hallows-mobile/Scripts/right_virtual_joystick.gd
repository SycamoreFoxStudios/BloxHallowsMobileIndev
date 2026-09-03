extends VirtualJoystick # Change to your node type (e.g., Sprite2D, TextureButton)

var is_dragging = false
var touch_offset = Vector2.ZERO

func _gui_input(event):
	# Detect mobile touch start
	if event is InputEventScreenTouch:
		if event.pressed:
			is_dragging = true
			# Calculate offset so the node doesn't snap its center to your finger
			touch_offset = global_position - event.position
		else:
			is_dragging = false
