extends ColorRect

@onready var scroll_bar = get_parent().get_v_scroll_bar()


func _input(event):
	if event is InputEventScreenDrag:
		scroll_bar.value += event.velocity.normalized()[1] * 0.25
