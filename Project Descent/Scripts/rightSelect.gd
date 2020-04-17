extends Button

onready var classText = get_node("../className")
onready var weaponSprite = get_node("../weaponSprite")

onready var classCount = get_node("../leftSelect").classCount

func _on_rightSelect_pressed():
	if classCount == 0:
		classText.text = "Archer"
		weaponSprite.texture = load("./Assets/Icons/bow.png")
		classCount = 1
	elif classCount == 1:
		classText.text = "Mage"
		weaponSprite.texture = load("./Assets/Icons/mage.png")
		classCount = 2
	else:
		classText.text = "Warrior"
		weaponSprite.texture = load("./Assets/Icons/sword.png")
		classCount = 0
	get_node("../leftSelect").classCount = classCount
