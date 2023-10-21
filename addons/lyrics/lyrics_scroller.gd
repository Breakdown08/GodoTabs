extends ColorRect

@onready var scroll_bar: VScrollBar = get_parent().get_v_scroll_bar()


func _ready():
	EventBus.time_to_scroll.connect(scroll)
	

func _input(event):
	if event is InputEventScreenDrag:
		var y_velocity: float = event.velocity.normalized()[1]
		scroll_bar.value -= y_velocity * 0.2


func scroll():
	scroll_bar.value += 0.125
