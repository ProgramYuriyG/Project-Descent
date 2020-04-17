extends Button

onready var genderSprite = get_node("../genderSprite")
onready var genderName = get_node("../genderName")

onready var player = get_node("/root/Player")

var genderCount = 0

func _on_leftSelectGender_pressed():
	if genderCount == 0:
		genderSprite.texture = load("./Assets/Icons/femaleSymbol.png")
		genderName.text = "Female"
		genderCount = 1
	else:
		genderSprite.texture = load("./Assets/Icons/maleSymbol.png")
		genderName.text = "Male"
		genderCount = 0
	
	player.playerGender = genderName.text
	player.setPlayerSprites()
	print(player.getIdleAnimation())
	player.get_node("PlayerAnimationPlayer").play(player.getIdleAnimation())
