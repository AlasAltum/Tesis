class_name StackRepresentation
extends ADTRepresentation
# This class is intended to be shown in the ADTShower class


const node_label_prefab = preload("res://AlgorithmScenes/Screen/ADT/NodeInADT.tscn")
onready var nodes_vbox: VBoxContainer = $NodesVBox
var label_indexes: Dictionary = {}  # Dictionary<int, Label>


func _ready() -> void:
	self.position = Vector2(80.0, 20.0)


# Add new node to the StackADT representation
func add_node(node: AGraphNode) -> void:
	var new_label: Label = node_label_prefab.instance()
	new_label.text = str(node.index)
	# Change name in tree, so it can be erased later by using its index
	new_label.name = "NodeInStack" + str(node.index)
	label_indexes[node.index] = new_label
	nodes_vbox.add_child(new_label)
	# nodes_vbox.move_child(new_label, 0)

# Remove Node from the StackADT representation
func remove_node(node: AGraphNode) -> void:
	var child_to_remove: Label = label_indexes[node.index]
	child_to_remove.queue_free()

func get_representation() -> StackRepresentation:
	return self.representation

func clear():
	label_indexes.clear()
	for child in nodes_vbox.get_children():
		child.queue_free()
