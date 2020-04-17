extends Node2D

onready var monsterSpriteIdle = $monsterSpriteIdle
onready var monsterSpriteRun = $monsterSpriteRun
onready var monsterSpriteAttack = $monsterSpriteAttack
onready var monsterSpriteHurt = $monsterSpriteHurt
onready var monsterSpriteDead = $monsterSpriteDead


onready var monsterHealthLabel = $monsterHealth

onready var monsterName = ""
onready var monsterDamage = 0

onready var monsterDead = false
onready var monsterAttacked = false
onready var monsterDeadCount = 0

signal monsterDead
signal monsterAnimationFinished


#function to choose a random monster to generate
func chooseMonsterType():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var random_value = random.randi_range(1, 2)
	
	if monsterDeadCount == 4:
		monsterName = "orcBoss"
		monsterDamage = 4
		monsterHealthLabel.text = str(75)
	elif random_value == 1:
		monsterName = "skeleton"
		monsterDamage = 2
		monsterHealthLabel.text = str(30)
	elif random_value == 2:
		monsterName = "goblin"
		monsterDamage = 1
		monsterHealthLabel.text = str(22)


func setMonster():
	chooseMonsterType()
	setMonsterIdle()
	setMonsterRun()
	setMonsterAttack()
	setMonsterHurt()
	setMonsterDeath()


# the function to set the paramaters of the monster idle animation
func setMonsterIdle():
	monsterSpriteIdle.frame_coords = Vector2(0, 0)
	if monsterName == "goblin":
		monsterSpriteIdle.texture = load("res://Assets/Characters/goblin/Idle.png")
		monsterSpriteIdle.hframes = 4
		monsterSpriteIdle.scale.x = 0.385
		monsterSpriteIdle.scale.y = 0.385
		monsterSpriteIdle.position.x = 80.514
		monsterSpriteIdle.position.y = 18.2
	elif monsterName == "skeleton":
		monsterSpriteIdle.texture = load("res://Assets/Characters/basicSkeleton/Skeleton Idle.png")
		monsterSpriteIdle.hframes = 11
		monsterSpriteIdle.scale.x = 0.734
		monsterSpriteIdle.scale.y = 0.734
		monsterSpriteIdle.position.x = 79.5
		monsterSpriteIdle.position.y = 16.75
	elif monsterName == "orcBoss":
		monsterSpriteIdle.texture = load("res://Assets/Characters/orcBoss/IDLE/IDLE_000.png")
		monsterSpriteIdle.hframes = 1
		monsterSpriteIdle.scale.x = 0.022
		monsterSpriteIdle.scale.y = 0.022
		monsterSpriteIdle.position.x = 74.663
		monsterSpriteIdle.position.y = 16.321



# the function to set the paramaters of the monster run animation
func setMonsterRun():
	monsterSpriteRun.frame_coords = Vector2(0, 0)
	if monsterName == "goblin":
		monsterSpriteRun.texture = load("res://Assets/Characters/goblin/Run.png")
		monsterSpriteRun.hframes = 8
		monsterSpriteRun.scale.x = 0.385
		monsterSpriteRun.scale.y = 0.385
		monsterSpriteRun.position.x = 80.514
		monsterSpriteRun.position.y = 18.2
	elif monsterName == "skeleton":
		monsterSpriteRun.texture = load("res://Assets/Characters/basicSkeleton/Skeleton Walk.png")
		monsterSpriteRun.hframes = 13
		monsterSpriteRun.scale.x = 0.734
		monsterSpriteRun.scale.y = 0.734
		monsterSpriteRun.position.x = 79.5
		monsterSpriteRun.position.y = 16.75


# the function to set the paramaters of the monster attack animation
func setMonsterAttack():
	monsterSpriteAttack.frame_coords = Vector2(0, 0)
	if monsterName == "goblin":
		monsterSpriteAttack.texture = load("res://Assets/Characters/goblin/Attack.png")
		monsterSpriteAttack.hframes = 8
		monsterSpriteAttack.scale.x = 0.385
		monsterSpriteAttack.scale.y = 0.385
		monsterSpriteAttack.position.x = 25
		monsterSpriteAttack.position.y = 18.2
	elif monsterName == "skeleton":
		monsterSpriteAttack.texture = load("res://Assets/Characters/basicSkeleton/Skeleton Attack.png")
		monsterSpriteAttack.hframes = 18
		monsterSpriteAttack.scale.x = 0.734
		monsterSpriteAttack.scale.y = 0.734
		monsterSpriteAttack.position.x = 24.392
		monsterSpriteAttack.position.y = 15.287


# the function to set the paramaters of the monster hurt animation
func setMonsterHurt():
	monsterSpriteHurt.frame_coords = Vector2(0, 0)
	if monsterName == "goblin":
		monsterSpriteHurt.texture = load("res://Assets/Characters/goblin/Take Hit.png")
		monsterSpriteHurt.hframes = 4
		monsterSpriteHurt.scale.x = 0.385
		monsterSpriteHurt.scale.y = 0.385
		monsterSpriteHurt.position.x = 80.514
		monsterSpriteHurt.position.y = 18.2
	elif monsterName == "skeleton":
		monsterSpriteHurt.texture = load("res://Assets/Characters/basicSkeleton/Skeleton Hit.png")
		monsterSpriteHurt.hframes = 8
		monsterSpriteHurt.scale.x = 0.734
		monsterSpriteHurt.scale.y = 0.734
		monsterSpriteHurt.position.x = 81.78
		monsterSpriteHurt.position.y = 16.669
	elif monsterName == "orcBoss":
		monsterSpriteHurt.texture = load("res://Assets/Characters/orcBoss/HURT/HURT_000.png")
		monsterSpriteHurt.hframes = 1
		monsterSpriteHurt.scale.x = 0.022
		monsterSpriteHurt.scale.y = 0.022
		monsterSpriteHurt.position.x = 74.663
		monsterSpriteHurt.position.y = 16.321


# the function to set the paramaters of the monster dead animation
func setMonsterDeath():
	monsterSpriteDead.frame_coords = Vector2(0, 0)
	if monsterName == "goblin":
		monsterSpriteDead.texture = load("res://Assets/Characters/goblin/Death.png")
		monsterSpriteDead.hframes = 4
		monsterSpriteDead.scale.x = 0.385
		monsterSpriteDead.scale.y = 0.385
		monsterSpriteDead.position.x = 80.514
		monsterSpriteDead.position.y = 18.2
	elif monsterName == "skeleton":
		monsterSpriteDead.texture = load("res://Assets/Characters/basicSkeleton/Skeleton Dead.png")
		monsterSpriteDead.hframes = 15
		monsterSpriteDead.scale.x = 0.734
		monsterSpriteDead.scale.y = 0.734
		monsterSpriteDead.position.x = 83.361
		monsterSpriteDead.position.y = 16.669
	elif monsterName == "orcBoss":
		monsterSpriteDead.texture = load("res://Assets/Characters/orcBoss/DIE/DIE_000.png")
		monsterSpriteDead.hframes = 1
		monsterSpriteDead.scale.x = 0.022
		monsterSpriteDead.scale.y = 0.022
		monsterSpriteDead.position.x = 74.663
		monsterSpriteDead.position.y = 16.321


#functions to return the string animation that will play for each monster
func getMonsterIdle():
	return monsterName+"Idle"

func getMonsterRun():
	return monsterName+"Run"

func getMonsterAttack():
	return monsterName+"Attack"
	
func getMonsterHurt():
	return monsterName+"Hurt"

func getMonsterDead():
	return monsterName+"Dead"


#function that will return a signal when the monster spriteDead changes its visibility
func _on_monsterSpriteDead_visibility_changed():
	emit_signal("monsterDead")

func _on_MonsterAnimationPlayer_animation_finished(anim_name):
	emit_signal("monsterAnimationFinished", anim_name)


#Skeleton Idle:
#	H-Frames: 11
#	V-Frames: 1
#	Frames: 0 - 10
#   	Scale-X: 0.734
#   	Scale-Y: 0.734
#	Position-x: 79.5
#	Position-Y: 16.75

#Skeleton Hurt:
#	H-Frames: 8
#	V-Frames: 1
#	Frames: 0 - 7
#	Scale-X: 0.734
#	Scale-Y: 0.734
#	Position-x: 81.78
#	Position-Y: 16.669

#Skeleton Dead:
#	H-Frames: 15
#	V-Frames: 0
#	Frames: 0 - 21
#	Scale-X: 0.734
#	Scale-Y: 0.734
#	Position-x: 83.361
#	Position-Y: 16.669

#Skeleton Attack:
#	H-Frames: 18
#	V-Frames: 1
#	Frames: 0 - 17
#	Scale-X: 0.734
#	Scale-Y: 0.734
#	Position-x: 24.392
#	Position-Y: 15.287

#Skeleton Run:
#	H-Frames: 13
#	V-Frames: 1
#	Frames: 0 - 12
#	Scale-X: 0.734
#	Scale-Y: 0.734
#	Position-x: 79.5
#	Position-Y: 16.75
#	Move To: (30, 16.75)



#Goblin Idle:
#	H-Frames: 4
#	V-Frames: 1
#	Frames: 0 - 3
#   	Scale-X: 0.385
#   	Scale-Y: 0.385
#	Position-x: 80.514
#	Position-Y: 18.2

#Goblin Hurt:
#	H-Frames: 4
#	V-Frames: 1
#	Frames: 0 - 3
#	Scale-X: 0.385
#	Scale-Y: 0.385
#	Position-x: 80.514
#	Position-Y: 18.2

#Goblin Dead:
#	H-Frames: 4
#	V-Frames: 0
#	Frames: 0 - 3
#   	Scale-X: 0.385
#   	Scale-Y: 0.385
#	Position-x: 80.514
#	Position-Y: 18.2

#Goblin Attack:
#	H-Frames: 8
#	V-Frames: 1
#	Frames: 0 - 7
#	Scale-X: 0.385
#	Scale-Y: 0.385
#	Position-x: 25
#	Position-Y: 18.2

#Goblin Run:
#	H-Frames: 8
#	V-Frames: 1
#	Frames: 0 - 7
#	Scale-X: 0.385
#	Scale-Y: 0.385
#	Position-x: 80.514
#	Position-Y: 18.2
#	Move To: (25, 18.2)


#OrcBoss Idle:
#	H-Frames: 7
#	V-Frames: 1
#	Frames: 0 - 6
#   Scale-X: 0.022
#   Scale-Y: 0.022
#	Position-x: 73
#	Position-Y: 15

#OrcBoss Hurt:
#	H-Frames: 7
#	V-Frames: 1
#	Frames: 0 - 6
#   Scale-X: 0.022
#   Scale-Y: 0.022
#	Position-x: 73
#	Position-Y: 15

#OrcBoss Dead:
#	H-Frames: 7
#	V-Frames: 1
#	Frames: 0 - 6
#   Scale-X: 0.022
#   Scale-Y: 0.022
#	Position-x: 73
#	Position-Y: 15
