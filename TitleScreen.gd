extends Control
class_name TitleScreen

func _on_StartGame_pressed() -> void:
    get_tree().change_scene("res://Deck.tscn")



func _on_KubreLink_pressed() -> void:
    OS.shell_open("https://kubre.in")

func _on_GodotLink_pressed() -> void:
    OS.shell_open("https://godotengine.org")
