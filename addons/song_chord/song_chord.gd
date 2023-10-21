extends Label 
class_name SongChord

var id: int
var lyrics: Lyrics
var line: int
var column: int
var chord_draw_position: Vector2
@export var offset: Vector2 = Vector2(-5, -40)


func _process(delta):
	if id != null:
		chord_draw_position = lyrics.get_caret_draw_pos(id)
		set_position(chord_draw_position + offset)


func register():
	line = lyrics.chords_positions[self]["line"]
	column = lyrics.chords_positions[self]["column"]
	text = lyrics.chords_positions[self]["name"]
	id = lyrics.add_caret(line, column)
