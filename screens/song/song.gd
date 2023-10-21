extends Control

var id_song: int
@onready var title = $PanelContainer/VBoxContainer/HBoxContainer/Title
@onready var lyrics = $PanelContainer/VBoxContainer/MarginContainer/Lyrics
var lyrics_data: String
var tabs_data: Array[Dictionary]
@onready var play_button = $PanelContainer/VBoxContainer/HBoxContainer/PlayButton
@export var play_icon = preload("res://icons/play_icon.svg")
@export var pause_icon = preload("res://icons/pause_icon.svg")
@export var back_to_menu_icon = preload("res://icons/back_icon.svg")
@export var is_playing: bool = 0
var auto_scrolling_speed: float
@onready var scroll_timer: Timer = $PanelContainer/VBoxContainer/HBoxContainer/PlayButton/ScrollTimer
@onready var scroll_speed_slider = $PanelContainer/SliderVBoxContainer/Panel/VBoxContainer/AutoScrollSpeedSlider


func _ready():
	scroll_timer.set_wait_time(invert(scroll_speed_slider.value, scroll_speed_slider.max_value, scroll_speed_slider.step))
	id_song = ScreenManager.get_param("id_song")
	title.text = ScreenManager.get_param("title")
	lyrics_data = DbManager.get_song_lyrics(id_song)
	lyrics.set_lyrics(lyrics_data)
	tabs_data = DbManager.get_song_tabs(id_song)
	lyrics.load_tabs(tabs_data)


func _on_play_button_pressed():
	is_playing = !is_playing
	if is_playing:
		play_button.icon = pause_icon
		scroll_timer.start()
	else:
		play_button.icon = play_icon
		scroll_timer.stop()
		

func _on_back_to_menu_button_pressed():
	ScreenManager.change_scene(ScreenManager.songs_list_scene)


func _on_auto_scroll_speed_slider_value_changed(value):
	scroll_timer.set_wait_time(invert(value, scroll_speed_slider.max_value, scroll_speed_slider.step))
	
	
func _on_scroll_timer_timeout():
	EventBus.time_to_scroll.emit()
	

func invert(current_value: float, max_value: float, step: float) -> float:
	var _max_value = max_value + step
	return _max_value - current_value
	

func _input(event):
	if event.is_action_pressed("ui_accept"):
		tabs_data = DbManager.get_song_tabs(id_song)
		lyrics.load_tabs(tabs_data)
