extends Control

@onready var lyrics = $Panel/MarginContainer/ScrollContainer/TextEdit


func set_lyrics(data: String):
	lyrics.text = data
	

func load_tabs(data: Array[Dictionary]):
	lyrics.add_chords(data)
	
