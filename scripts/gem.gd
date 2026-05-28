extends RigidBody2D

@export var gem_data: GemData
@export var rotation_speed: float = PI

signal bonus_clicked(value: int)

@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon: CollisionPolygon2D = $CollisionPolygon2D


func _ready() -> void:
	polygon_2d.polygon = gem_data.polygon
	polygon_2d.color = gem_data.color
	collision_polygon.polygon = gem_data.polygon
	angular_velocity = rotation_speed


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		bonus_clicked.emit(gem_data.value)
		queue_free()
