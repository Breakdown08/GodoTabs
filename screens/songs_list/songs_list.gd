extends Control

@onready var song_button = preload("res://addons/song_button/song_button.tscn")
@onready var list = $MarginContainer/PanelContainer/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer


func _ready():
	var dataset = DbManager.get_all_songs_titles()
	for item in dataset:
		var button = song_button.instantiate()
		button.text = item["title"]
		button.id_song = item["id"]
		button.name = "Song_" + str(item["id"])
		list.add_child(button)
