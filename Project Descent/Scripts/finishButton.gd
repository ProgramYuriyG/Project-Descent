extends Button

onready var player = get_node("/root/Player")
onready var genderName = get_node("../Gender/genderName")
onready var className = get_node("../Class/className")
onready var playerName = get_node("../Name/enteredName")

func _on_finishButton_pressed():
	
	if playerName.text != null and playerName.text != "":
		player.playerName = playerName.text
	player.playerGender = genderName.text
	player.playerClassName = className.text
	
	print(player.playerName)
	print(player.playerGender)
	print(player.playerClassName)
	
	Player.setPlayer()
	get_tree().change_scene("res://Scenes/Village.tscn")
