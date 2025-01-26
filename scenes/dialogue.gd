extends Control

var convos = ["What's going on here?", "We don't know either! Please find out for us, Bobble!"]
var sprites = ["res://sprites/bobble.png", "res://sprites/horde.png"]
var curr_idx = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index==MOUSE_BUTTON_LEFT:
		if curr_idx >= convos.size():
			print("figure out change scene")
		else:
			$Label.text = convos[curr_idx]
			change_sprite(sprites[curr_idx])
			curr_idx+=1
	#	if input event is a click, then proceed to next dialogue
	pass # Replace with function body.

	
func change_sprite(sprite_name: String):
	var new_sprite = load(sprite_name)
	$Sprite2D.texture = new_sprite
	pass
	
