extends RichTextLabel

@export var duration: float = 3.0  # Fade duration in seconds

func _ready():
	# Enable BBCode
	set_use_bbcode(true)
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", Color.BLACK, duration)
