class_name ADTRepresentation
extends Node2D

# To be overriden by:
# NodeRepresentation, StackRepresentation, QueueRepresentation

func _ready() -> void:
	pass # Replace with function body.


# Override this method
func _add_node(node) -> void:
	pass

# Override this method
func _remove_node(node) -> void:
	pass

func set_properties() -> void:
	pass

func get_initial_position() -> Vector2:
	return Vector2(50.0, 10.0)
