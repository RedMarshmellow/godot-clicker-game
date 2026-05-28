extends RigidBody2D

@export var rotation_speed: float = PI
@export var value: int = 100

signal bonus_clicked(value: int)

func _ready() -> void:
	$CollisionPolygon2D.polygon = $Polygon2D.polygon
	angular_velocity = rotation_speed


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		bonus_clicked.emit(value)
		queue_free()
