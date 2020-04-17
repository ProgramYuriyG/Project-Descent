extends Button


onready var classText = get_node("../className")
onready var weaponSprite = get_node("../weaponSprite")

var classCount = 0

func _on_leftSelect_pressed():
	if classCount == 0:
		classText.text = "Mage"
		weaponSprite.texture = load("./Assets/Icons/mage.png")
		classCount = 2
	elif classCount == 2:
		classText.text = "Archer"
		weaponSprite.texture = load("./Assets/Icons/bow.png")
		classCount = 1
	else:
		classText.text = "Warrior"
		weaponSprite.texture = load("./Assets/Icons/sword.png")
		classCount = 0
		
