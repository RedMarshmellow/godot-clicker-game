extends Node

var money: int = 0
var click_power: int = 1
var auto_miner_level: int = 0
var auto_miner_income: int = 1
var click_power_price: int = 100
var auto_miner_price: int = 200
@export var bonus_resource: PackedScene

@onready var hud: CanvasLayer = $Hud
@onready var auto_miner: Timer = $AutoMiner
@onready var bonus_spawn_location: PathFollow2D = $BonusPath/BonusSpawnLocation
@onready var bonus_timer: Timer = $BonusTimer


func _ready() -> void:
	auto_miner.wait_time = 1.0
	hud.update_money(money)
	hud.update_click_power_price(click_power_price)
	hud.update_auto_miner_price(auto_miner_price)


func _on_click_target_pressed() -> void:
	money += click_power
	hud.update_money(money)


func _on_auto_miner_timeout() -> void:
	money += auto_miner_income
	hud.update_money(money)


func _on_hud_click_power_purchased() -> void:
	if money >= click_power_price:
		money -= click_power_price
		hud.update_money(money)
		click_power += 1
		click_power_price = int(click_power_price * 1.5)
		hud.update_click_power_price(click_power_price)


func _on_hud_auto_miner_purchased() -> void:
	if money >= auto_miner_price:
		money -= auto_miner_price
		hud.update_money(money)
		auto_miner_level += 1
		auto_miner_price = int(auto_miner_price * 1.5)
		auto_miner_income = auto_miner_level + 1
		auto_miner.wait_time = max(0.2, 1.0 - auto_miner_level * 0.08)
		hud.update_auto_miner_price(auto_miner_price)
		if auto_miner.is_stopped():
			auto_miner.start()


func _on_bonus_timer_timeout() -> void:
	var bonus = bonus_resource.instantiate()

	bonus.bonus_clicked.connect(_on_bonus_clicked)

	bonus_spawn_location.progress_ratio = randf()

	bonus.position = bonus_spawn_location.position

	var direction = bonus_spawn_location.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	bonus.rotation = direction

	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	bonus.linear_velocity = velocity.rotated(direction)

	add_child(bonus)

	bonus_timer.wait_time = randf_range(3, 10)

func _on_bonus_clicked(value: int) -> void:
	money += value * (click_power + auto_miner_level)
	hud.update_money(money)
