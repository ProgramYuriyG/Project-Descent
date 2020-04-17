extends Node2D

onready var player = get_node("/root/Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	player.setPlayer()
	player.visible = true
	player.get_node("playerSpriteIdle").visible = true
	player.get_node("PlayerAnimationPlayer").play(Player.getIdleAnimation())


func _on_createCharacter_tree_exiting():
	player.visible = false
	player.get_node("playerSpriteIdle").visible = false
	player.get_node("PlayerAnimationPlayer").stop()
