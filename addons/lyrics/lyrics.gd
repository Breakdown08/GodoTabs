extends TextEdit
class_name Lyrics

var chords_positions: Dictionary = {}
@export var chord_offset: Vector2 = Vector2(-5, -40)
var chord_node = preload("res://addons/song_chord/song_chord.tscn")
	
	
func set_caret_position(column: int, line: int):
	set_caret_line(line)
	set_caret_column(column)
	

func add_chords(tabs_data: Array[Dictionary]):
	remove_secondary_carets()
	clear_children()
	for tab in tabs_data:
		register_new_chord(tab["name"], tab["line"], tab["column"])
	chords_positions = {}


func register_new_chord(chord_name: String, line: int, column: int):
	var chord = chord_node.instantiate()
	chord.lyrics = self
	chords_positions.merge({chord: {"name": chord_name, "line": line, "column": column}})
	add_child(chord)
	chord.register()
	

func clear_children():
	for child in get_children():
		if child is Label:
			remove_child(child)
			child.free()


