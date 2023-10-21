extends Control

@onready var lyrics = $Panel/VBoxContainer/TextEdit
@onready var viewport = $Panel/VBoxContainer/TextEdit/TouchScroller


func set_lyrics(data: String):
	lyrics.text = data
	

func load_tabs(data: Array[Dictionary]):
	lyrics.add_chords(data)
