extends Label

onready var welcomeText = get_node("../welcomeText")
onready var player = get_node("/root/Player")

#variables to change the visibility on
onready var background = get_node("../shopBackground")
onready var itemContainer = get_node("../Container")
onready var leftSelect = get_node("../shopLeftSelect")
onready var rightSelect = get_node("../shopRightSelect")
onready var skipButton = get_node("../skipTextButton")

var count = 0
var next = 0

func _ready():
	welcomeText.text = "Welcome to my shop " + player.playerName
	welcomeText.visible_characters = 0
	background.visible = false
	itemContainer.visible = false
	leftSelect.visible = false
	rightSelect.visible = false
		
func _process(delta):
	if next < 3:
		count += delta
	if next == 0 and count > 0.15:
		welcomeText.visible_characters += 1
		count = 0
		if welcomeText.visible_characters == len(welcomeText.text):
			welcomeText.visible_characters = 0
			welcomeText.text = "Maybe you'll take a fancy to something. \nTake your Time"
			next = 1
		
	if next == 1 and count > 0.15:
		welcomeText.visible_characters += 1
		count = 0
		if welcomeText.visible_characters == len(welcomeText.text):
			next = 2
			
	if next == 2 and count > 0.4:
		background.visible = true
		itemContainer.visible = true
		leftSelect.visible = true
		rightSelect.visible = true
		welcomeText.text = "Shop"
		welcomeText.visible_characters = len(welcomeText.text)
		count = 0
		next = 3


func _on_skipTextButton_pressed():
	if next < 2:
		if next == 0:
			welcomeText.text = "Maybe you'll take a fancy to something. \nTake your Time"
		welcomeText.visible_characters = 0
		count = 0
		next += 1
	else:
		skipButton.disabled = true
		skipButton.visible = false

