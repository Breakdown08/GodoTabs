extends Control

var id_song: int
@onready var lyrics = $MarginContainer/ScrollContainer/VBoxContainer/Lyrics
@onready var title = $MarginContainer/ScrollContainer/VBoxContainer/Title
var lyrics_data: String
var tabs_data: Array[Dictionary]


func _ready():
	id_song = ScreenManager.get_param("id_song")
	title.text = ScreenManager.get_param("title")
	lyrics_data = DbManager.get_song_lyrics(id_song)
	lyrics.set_lyrics(lyrics_data)
	tabs_data = DbManager.get_song_tabs(id_song)
	lyrics.load_tabs(tabs_data)
