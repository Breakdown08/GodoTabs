extends TextEdit
class_name Lyrics

var chords_positions: Dictionary = {}
@export var chord_offset: Vector2 = Vector2(-5, -40)
	
	
func set_caret_position(column: int, line: int):
	set_caret_line(line)
	set_caret_column(column)
	

func add_chords(tabs_data: Array[Dictionary]):
	for tab in tabs_data:
		register_new_chord(tab["name"], tab["line"], tab["column"])


func register_new_chord(chord_name: String, line: int, column: int):
	var chord: SongChord = SongChord.new()
	chord.lyrics = self
	chords_positions.merge({chord: {"name": chord_name, "line": line, "column": column}})
	add_child(chord)
	chord.register()
		
		
func get_caret_position() -> Vector2:
	return Vector2(get_caret_column(), get_caret_line())
