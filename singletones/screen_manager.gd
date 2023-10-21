extends Node

var songs_list_scene = preload("res://screens/songs_list/songs_list.tscn")
var selected_song_scene = preload("res://screens/song/song.tscn")

var _params = null


func change_scene(next_scene, params=null):
	_params = params
	get_tree().change_scene_to_packed(next_scene)


func get_param(key):
	if _params != null and _params.has(key):
		return _params[key]
	return null
