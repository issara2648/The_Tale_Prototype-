extends Node2D

@export var all_events: Array[CardData] # ไว้ใส่การ์ดที่สร้างจากขั้นตอนที่ 3
var current_step = 0 # ตำแหน่งปัจจุบันของผู้เล่น (เริ่มที่ 0)

@onready var player = $Player
@onready var points = $PathPoints.get_children() # ดึงจุด Marker ทั้งหมดมาเป็น Array
@onready var card_ui = $CanvasLayer/CardUI # อ้างอิงถึงหน้าจอการ์ด

func _on_roll_button_pressed():
	# 1. ทอยเต๋า 1-3
	var dice_result = randi_range(1, 3)
	print("ทอยได้: ", dice_result)
	
	# 2. คำนวณตำแหน่งใหม่
	current_step += dice_result
	
	# กันไม่ให้เดินเกินจำนวนจุดที่มี
	if current_step >= points.size():
		current_step = points.size() - 1
	
	# 3. ย้ายตัวละคร (แบบวาร์ป)
	var target_pos = points[current_step].global_position
	move_player(target_pos)

func move_player(target_pos):
	player.global_position = target_pos
	# เมื่อเดินเสร็จ ให้จั่วการ์ด
	trigger_event()

func trigger_event():
	if all_events.size() > 0:
		var random_event = all_events.pick_random()
		card_ui.display_card(random_event)
