extends Node2D

onready var player = get_node("/root/Player")

func _ready():
	print(player.playerName)
	print(player.playerGender)
	print(player.playerClassName)
