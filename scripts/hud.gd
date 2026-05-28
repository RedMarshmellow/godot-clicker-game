extends CanvasLayer

signal click_target_pressed
signal click_power_purchased
signal auto_miner_purchased

const MAX_CPS: int = 30

var cooldown: float
var time_since_last_click: float

@onready var money_label: Label = $Money
@onready var click_power_button: Button = $ClickPower
@onready var auto_miner_button: Button = $AutoMiner


func _ready() -> void:
	cooldown = 1.0 / MAX_CPS
	time_since_last_click = 0.0


func _process(delta: float) -> void:
	time_since_last_click += delta


func _on_click_target_pressed() -> void:
	if time_since_last_click >= cooldown:
		time_since_last_click = 0.0
		click_target_pressed.emit()


func update_money(new_value: int) -> void:
	money_label.text = "Money: " + str(new_value)


func _on_click_power_pressed() -> void:
	click_power_purchased.emit()


func _on_auto_miner_pressed() -> void:
	auto_miner_purchased.emit()


func update_click_power_price(new_value: int) -> void:
	click_power_button.text = "Click Power\n$" + str(new_value)


func update_auto_miner_price(new_value: int) -> void:
	auto_miner_button.text = "Auto Miner\n$" + str(new_value)
