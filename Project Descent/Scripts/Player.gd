extends Node2D

signal animationFinished
onready var playerIdle = $playerSpriteIdle
onready var playerRun = $playerSpriteRun
onready var playerHurt = $playerSpriteHurt
onready var playerAttack = $playerSpriteAttack
onready var playerBlock = $playerSpriteBlock
onready var playerDead = $playerSpriteDead

onready var playerHealthBar = $playerHealthBar
onready var playerAnimation = $PlayerAnimationPlayer

var playerName = "Bob" setget setName
var playerGender = "Male" setget setGender
var playerClassName = "Warrior" setget setClassName

var playerHealth = 5
var playerDamage = 9

var playerBlockedAttack = false
var isPlayerDead = false

func _ready():
	self.visible = false


func setName(new_name):
	playerName = new_name
	
func setGender(new_gender):
	playerGender = new_gender
	
func setClassName(new_classname):
	playerClassName = new_classname

func getPlayerDamage():
	return playerDamage


func setPlayer():
	changeHealthLabel(playerHealth)
	setPlayerIdle()
	setPlayerHurt()
	setPlayerAttack()
	setPlayerBlock()
	setPlayerRun()
	setPlayerDead()


func getIdleAnimation():
	if playerGender == "Male":
		return "maleWarriorIdle"
	elif playerGender == "Female":
		return "femaleWarriorIdle"


func getRunAnimation():
	if playerGender == "Male":
		return "maleWarriorRun"
	elif playerGender == "Female":
		return "femaleWarriorRun"


func getHurtAnimation():
	if playerGender == "Male":
		return "maleWarriorHurt"
	elif playerGender == "Female":
		return "femaleWarriorHurt"


func getAttackAnimation():
	if playerGender == "Male":
		return "maleWarriorAttack"
	elif playerGender == "Female":
		return "femaleWarriorAttack"


func getBlockAnimation():
	if playerGender == "Male":
		return "maleWarriorBlock"
	elif playerGender == "Female":
		return "femaleWarriorBlock"


func getDeathAnimation():
	if playerGender == "Male":
		return "maleWarriorDead"
	elif playerGender == "Female":
		return "femaleWarriorDead"


func getRunningOffscreenRightAnimation():
	if playerGender == "Male":
		return "maleWarriorRunningOffscreenRight"
	elif playerGender == "Female":
		return "femaleWarriorRunningOffscreenRight"


func changeHealthLabel(healthValue):
	if healthValue < 0:
		healthValue = 0
	elif healthValue > 5:
		healthValue = 5
	playerHealth = healthValue
	if healthValue == 5:
		playerHealthBar.texture = load("res://Assets/playerCharacter/health/HP_Value_5.png")
	elif healthValue == 4:
		playerHealthBar.texture = load("res://Assets/playerCharacter/health/HP_Value_4.png")
	elif healthValue == 3:
		playerHealthBar.texture = load("res://Assets/playerCharacter/health/HP_Value_3.png")
	elif healthValue == 2:
		playerHealthBar.texture = load("res://Assets/playerCharacter/health/HP_Value_2.png")
	elif healthValue == 1:
		playerHealthBar.texture = load("res://Assets/playerCharacter/health/HP_Value_1.png")
	elif healthValue == 0:
		playerHealthBar.texture = load("res://Assets/playerCharacter/health/HP_Value_0.png")
		isPlayerDead = true
		playerAnimation.play(getDeathAnimation())


func setPlayerIdle():
	playerIdle.frame_coords = Vector2(0, 0)
	if playerGender == "Male":
		playerIdle.texture = load("res://Assets/playerCharacter/maleKnight/noBKG_KnightIdle_strip.png")
		playerIdle.hframes = 15
		playerIdle.scale.x = 0.42
		playerIdle.scale.y = 0.42
		playerIdle.position.x = 7
		playerIdle.position.y = 23
	elif playerGender == "Female":
		playerIdle.texture = load("res://Assets/playerCharacter/femaleKnight/Idle.png")
		playerIdle.hframes = 11
		playerIdle.scale.x = 0.3
		playerIdle.scale.y = 0.3
		playerIdle.position.x = 7
		playerIdle.position.y = 21


func setPlayerHurt():
	playerHurt.frame_coords = Vector2(0, 0)
	if playerGender == "Male":
		playerHurt.texture = load("res://Assets/playerCharacter/maleKnight/noBKG_KnightHurt_strip.png")
		playerHurt.hframes = 8
		playerHurt.scale.x = 0.42
		playerHurt.scale.y = 0.42
		playerHurt.position.x = 7
		playerHurt.position.y = 23
	elif playerGender == "Female":
		playerHurt.texture = load("res://Assets/playerCharacter/femaleKnight/Take Hit.png")
		playerHurt.hframes = 4
		playerHurt.scale.x = 0.3
		playerHurt.scale.y = 0.3
		playerHurt.position.x = 7
		playerHurt.position.y = 21


func setPlayerRun():
	playerRun.frame_coords = Vector2(0, 0)
	if playerGender == "Male":
		playerRun.texture = load("res://Assets/playerCharacter/maleKnight/noBKG_KnightRun_strip.png")
		playerRun.hframes = 8
		playerRun.scale.x = 0.42
		playerRun.scale.y = 0.42
		playerRun.position.x = 7
		playerRun.position.y = 23
	elif playerGender == "Female":
		playerRun.texture = load("res://Assets/playerCharacter/femaleKnight/Run.png")
		playerRun.hframes = 8
		playerRun.scale.x = 0.3
		playerRun.scale.y = 0.3
		playerRun.position.x = 7
		playerRun.position.y = 21


func setPlayerAttack():
	playerAttack.frame_coords = Vector2(0, 0)
	if playerGender == "Male":
		playerAttack.texture = load("res://Assets/playerCharacter/maleKnight/noBKG_KnightAttack_strip.png")
		playerAttack.hframes = 22
		playerAttack.scale.x = 0.42
		playerAttack.scale.y = 0.42
		playerAttack.position.x = 73
		playerAttack.position.y = 23
	elif playerGender == "Female":
		playerAttack.texture = load("res://Assets/playerCharacter/femaleKnight/Attack1.png")
		playerAttack.hframes = 7
		playerAttack.scale.x = 0.3
		playerAttack.scale.y = 0.3
		playerAttack.position.x = 73
		playerAttack.position.y = 21


func setPlayerBlock():
	playerBlock.frame_coords = Vector2(0, 0)
	if playerGender == "Male":
		playerBlock.texture = load("res://Assets/playerCharacter/maleKnight/noBKG_KnightShield_strip.png")
		playerBlock.hframes = 7
		playerBlock.scale.x = 0.42
		playerBlock.scale.y = 0.42
		playerBlock.position.x = 7
		playerBlock.position.y = 23
	elif playerGender == "Female":
		playerBlock.texture = load("res://Assets/playerCharacter/femaleKnight/femaleBlock.png")
		playerBlock.hframes = 10
		playerBlock.scale.x = 0.3
		playerBlock.scale.y = 0.3
		playerBlock.position.x = 10
		playerBlock.position.y = 20.627


func setPlayerDead():
	playerDead.frame_coords = Vector2(0, 0)
	if playerGender == "Male":
		playerDead.texture = load("res://Assets/playerCharacter/maleKnight/noBKG_KnightDeath_strip.png")
		playerDead.hframes = 15
		playerDead.scale.x = 0.42
		playerDead.scale.y = 0.42
		playerDead.position.x = 7
		playerDead.position.y = 23
	elif playerGender == "Female":
		playerDead.texture = load("res://Assets/playerCharacter/femaleKnight/Death.png")
		playerDead.hframes = 11
		playerDead.scale.x = 0.3
		playerDead.scale.y = 0.3
		playerDead.position.x = 7
		playerDead.position.y = 21


func _on_PlayerAnimationPlayer_animation_finished(anim_name):
	emit_signal("animationFinished", anim_name)


#Male Warrior Idle:
#	H-Frames: 15
#	V-Frames: 1
#	Frames: 0 - 14
#   Scale-X: 0.42
#   Scale-Y: 0.42
#	Position-x: 7
#	Position-Y: 23

#Male Warrior Run:
#	H-Frames: 8
#	V-Frames: 1
#	Frames: 0 - 7
#	Scale-X: 0.44
#	Scale-Y: 0.44
#	Position-x: 7
#	Position-Y: 23

#Male Warrior Attack:
#	H-Frames: 22
#	V-Frames: 1
#	Frames: 0 - 21
#   Scale-X: 0.42
#   Scale-Y: 0.42
#	Position-x: 73
#	Position-Y: 23


#Female Warrior Idle:
#	H-Frames: 11
#	V-Frames: 1
#	Frames: 0 - 10
#   	Scale-X: 0.3
#   	Scale-Y: 0.3
#	Position-x: 7
#	Position-Y: 21

#Female Warrior Run:
#	H-Frames: 8
#	V-Frames: 1
#	Frames: 0 - 7
#   	Scale-X: 0.3
#   	Scale-Y: 0.3
#	Position-x: 7
#	Position-Y: 21

#Female Warrior Attack:
#	H-Frames: 7
#	V-Frames: 1
#	Frames: 0 - 6
#   	Scale-X: 0.3
#   	Scale-Y: 0.3
#	Position-x: 7
#	Position-Y: 21
