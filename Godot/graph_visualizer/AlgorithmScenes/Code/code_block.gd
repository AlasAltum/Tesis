extends ScrollContainer
class_name CodeContainer

onready var lines_container = $LinesContainer
var code_lines: Array = []
var curr_line_index : int = 0
var current_line: CodeLine


func _ready():
	for child in lines_container.get_children():
		if child.get_class() == "CodeLine":
			code_lines.append(child)
	current_line = code_lines[0]


func advance_to_line(next_line: int) -> void:
	if next_line < code_lines.size():
		code_lines[curr_line_index].unfocus()
		self.curr_line_index = next_line
		code_lines[curr_line_index].focus()
		current_line = code_lines[curr_line_index]
	else:
		_on_code_finished()
		# TODO: Add notification msg that ended


func _input(event):
	if event.is_action_pressed("code_advance"):
		advance_to_line(current_line.get_next_line())


func _on_code_finished():
	pass
