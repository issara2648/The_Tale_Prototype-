extends Control

# อ้างอิงถึง Label ต่างๆ
@onready var title_label = $Panel/VBoxContainer/TitleLabel
@onready var desc_label = $Panel/VBoxContainer/DescLabel

func _ready():
	hide() # เริ่มเกมให้ซ่อนการ์ดไว้ก่อน

func display_card(data: CardData):
	title_label.text = data.title
	desc_label.text = data.description
	show() # แสดงการ์ด

func _on_close_button_pressed():
	hide() # เมื่อกดปุ่มตกลง ให้ซ่อนการ์ด
