extends Button

var id_song: int


func _on_pressed():
	ScreenManager.change_scene(ScreenManager.selected_song_scene, {"id_song": id_song, "title": text})
