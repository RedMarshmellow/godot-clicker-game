extends RefCounted
class_name GemTypes

static var ALL: Array[GemData] = [
	_round(), _oval(), _emerald(), _pear(), _heart(), _trillion()
]

static func pick_random() -> GemData:
	var total: float = 0.0
	for g in ALL:
		total += g.rarity_weight
	var roll: float = randf_range(0.0, total)
	var cumulative: float = 0.0
	for g in ALL:
		cumulative += g.rarity_weight
		if roll <= cumulative:
			return g
	return ALL[-1]

static func _round() -> GemData:
	var g = GemData.new()
	g.name = "Round"
	g.color = Color(0.5, 0.8, 1.0)
	g.polygon = PackedVector2Array([
		Vector2(0, -40), Vector2(28, -28), Vector2(40, 0),
		Vector2(28, 28), Vector2(0, 40), Vector2(-28, 28),
		Vector2(-40, 0), Vector2(-28, -28)
	])
	g.value = 50
	g.rarity_weight = 10.0
	return g

static func _oval() -> GemData:
	var g = GemData.new()
	g.name = "Oval"
	g.color = Color(0.3, 0.9, 0.4)
	g.polygon = PackedVector2Array([
		Vector2(0, -25), Vector2(15, -24), Vector2(28, -18),
		Vector2(38, -8), Vector2(40, 0), Vector2(38, 8),
		Vector2(28, 18), Vector2(15, 24), Vector2(0, 25),
		Vector2(-15, 24), Vector2(-28, 18), Vector2(-38, 8),
		Vector2(-40, 0), Vector2(-38, -8), Vector2(-28, -18),
		Vector2(-15, -24)
	])
	g.value = 75
	g.rarity_weight = 8.0
	return g

static func _emerald() -> GemData:
	var g = GemData.new()
	g.name = "Emerald"
	g.color = Color(0.1, 0.6, 0.1)
	g.polygon = PackedVector2Array([
		Vector2(-15, -40), Vector2(15, -40), Vector2(40, -15),
		Vector2(40, 15), Vector2(15, 40), Vector2(-15, 40),
		Vector2(-40, 15), Vector2(-40, -15)
	])
	g.value = 150
	g.rarity_weight = 5.0
	return g

static func _pear() -> GemData:
	var g = GemData.new()
	g.name = "Pear"
	g.color = Color(0.7, 0.3, 0.9)
	g.polygon = PackedVector2Array([
		Vector2(0, -40), Vector2(20, -30), Vector2(32, -12),
		Vector2(35, 8), Vector2(28, 25), Vector2(15, 38),
		Vector2(0, 45), Vector2(-15, 38), Vector2(-28, 25),
		Vector2(-35, 8), Vector2(-32, -12), Vector2(-20, -30)
	])
	g.value = 200
	g.rarity_weight = 4.0
	return g

static func _heart() -> GemData:
	var g = GemData.new()
	g.name = "Heart"
	g.color = Color(0.9, 0.2, 0.2)
	g.polygon = PackedVector2Array([
		Vector2(0, 30), Vector2(12, 22), Vector2(22, 10),
		Vector2(30, -5), Vector2(28, -22), Vector2(18, -33),
		Vector2(6, -38), Vector2(0, -35),
		Vector2(-6, -38), Vector2(-18, -33), Vector2(-28, -22),
		Vector2(-30, -5), Vector2(-22, 10), Vector2(-12, 22)
	])
	g.value = 400
	g.rarity_weight = 2.0
	return g

static func _trillion() -> GemData:
	var g = GemData.new()
	g.name = "Trillion"
	g.color = Color(1.0, 0.6, 0.0)
	g.polygon = PackedVector2Array([
		Vector2(0, 40), Vector2(12, 15), Vector2(35, -25),
		Vector2(0, -15), Vector2(-35, -25), Vector2(-12, 15)
	])
	g.value = 600
	g.rarity_weight = 1.0
	return g
