extends Button

onready var genderSprite = get_node("../genderSprite")
onready var genderName = get_node("../genderName")

onready var player = get_node("/root/Player")

onready var genderCount = get_node("../leftSelectGender").genderCount

func _on_rightSelectGender_pressed():
	if genderCount == 0:
		genderSprite.texture = load("./Assets/Icons/femaleSymbol.png")
		genderName.text = "Female"
		genderCount = 1
	else:
		genderSprite.texture = load("./Assets/Icons/maleSymbol.png")
		genderName.text = "Male"
		genderCount = 0
		
	get_node("../leftSelectGender").genderCount = genderCount
	player.playerGender = genderName.text
	player.setPlayer()
	player.get_node("PlayerAnimationPlayer").play(player.getIdleAnimation())
