extends Node
	
	
func get_all_songs_titles():
	var sql: String = "select id, title from songs;"
	return Database.query(sql)
	

func get_song_lyrics(id_song: int):
	var sql: String = "select lyrics from songs where id = %s;" % [str(id_song)]
	return Database.query(sql)[0]["lyrics"]
	

func get_song_tabs(id_song: int):
	var sql: String = "select chords.name, tabs.line, tabs.column from tabs join chords on chords.id == tabs.chord where tabs.song = %s;" % [str(id_song)]
	return Database.query(sql)
