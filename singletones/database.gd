extends Node

var db: SQLite = null
var data_path = "res://data/database"
const verbosity_level : int = SQLite.QUIET


func chords_table() -> Dictionary:
	return {
		"name": "chords",
		"struct": {
			"id": {"data_type":"int", "primary_key": true, "not_null": true},
			"name": {"data_type":"text", "not_null": true, "default": "''"},
		}
	}
	
	
func songs_table() -> Dictionary:
	return {
		"name": "songs",
		"struct": {
			"id": {"data_type":"int", "primary_key": true, "not_null": true},
			"title": {"data_type":"text", "not_null": true, "default": "''"},
			"lyrics": {"data_type":"text", "not_null": true, "default": "''"},
		}
	}
	
	
func tabs_table() -> Dictionary:
	return {
		"name": "tabs",
		"struct": {
			"id": {"data_type":"int", "primary_key": true, "not_null": true},
			"song": {"data_type": "int", "foreign_key": "songs.id", "not_null": true},
			"chord": {"data_type": "int", "foreign_key": "chords.id", "not_null": true},
			"line": {"data_type":"int", "not_null": true, "default": "0"},
			"column": {"data_type":"int", "not_null": true, "default": "0"},
		}
	}
	
	
func get_tables_to_create() -> Array :
	return [
		songs_table(),
		chords_table(),
		tabs_table(),
	]
	

func _ready():
	create_database()
	

func create_database():
	var tables: Array = get_tables_to_create()
	db = SQLite.new()
	db.read_only = true
	db.path = data_path
	db.verbosity_level = verbosity_level
	db.open_db()
	for table in tables:
		db.create_table(table["name"], table["struct"])
	db.close_db()


func query(sql: String):
	var result
	db.open_db()
	db.query(sql)
	result = db.query_result
	db.close_db()
	return result
