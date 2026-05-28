extends TextureButton

@onready var original_scale: Vector2 = scale

var tween: Tween


func _ready() -> void:
	pivot_offset = size / 2.0


func _on_button_down() -> void:
	if tween:
		tween.kill()
	scale = original_scale * 0.9	


func _on_button_up() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "scale", original_scale, 0.1).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
