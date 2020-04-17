extends Node2D

onready var player = get_node("/root/Player")
onready var monster = get_node("Monster")
onready var PlayerAnimationPlayer = player.get_node("PlayerAnimationPlayer")
onready var monsterAnimationPlayer = monster.get_node("MonsterAnimationPlayer")

onready var attackButton = get_node("attackButton")
onready var blockButton = get_node("blockButton")
onready var healthPotionButton = get_node("healthPotionButton")
onready var manaPotionButton = get_node("manaPotionButton")
onready var continueButton = get_node("continueButton")
onready var goldLabel = get_node("goldLabel")
onready var goldIcon = get_node("goldIcon")

onready var playerHealthLabel = player.get_node("playerHealthBar")

onready var runningFinished = attackButton.runningFinished

onready var blockButtonPressed = false
onready var monsterDelayTimer

# Called when the node enters the scene tree for the first time.
func _ready():	
	player.visible = true
	monster.visible = true
	player.get_node("playerSpriteIdle").visible = true
	player.get_node("playerHealthBar").visible = true
	monster.get_node("monsterSpriteIdle").visible = true
	monster.get_node("monsterHealth").visible = true
	
	blockButton.visible = false
	player.setPlayer()
	monster.setMonster()
	
	PlayerAnimationPlayer.play(player.getIdleAnimation())
	monsterAnimationPlayer.play(monster.getMonsterIdle())
	player.connect("animationFinished", self, "player_animation_finished")
	monster.connect("monsterDead", self, "_on_monsterSpriteDead_visibility_changed")
	monster.connect("monsterAnimationFinished", self, "on_monsterSprite_Animation_Finished")

func _on_attackButton_pressed():
	attackButton.disabled = true
	blockButton.disabled = true
	healthPotionButton.disabled = true
	manaPotionButton.disabled = true


func player_animation_finished(anim_name):
	#once the player finishes attacking and then the monster attacks
	if anim_name == player.getRunAnimation() and player.playerRun.flip_h == true:
		attackButton.visible = false
		
		attackButton.disabled = false
		blockButton.disabled = false
		healthPotionButton.disabled = false
		manaPotionButton.disabled = false
		if monster.monsterDead == false:
			#blockButton.visible = false
			attackButton.disabled = true
			blockButton.disabled = false
			healthPotionButton.disabled = true
			manaPotionButton.disabled = true
			monsterAnimationPlayer.play(monster.getMonsterRun())
	if anim_name == player.getRunAnimation() and monster.monsterDead == true:
		continueButton.visible = true


func on_monsterSprite_Animation_Finished(anim_name):
	if anim_name == monster.getMonsterAttack():
		if player.playerBlockedAttack == false:
			player.changeHealthLabel(player.playerHealth - monster.monsterDamage)
			if player.isPlayerDead == true:
				$deathLabel.visible = true
				attackButton.disabled = true
				blockButton.disabled = true
				healthPotionButton.disabled = true
				manaPotionButton.disabled = true
		else:
			# the player has taken no damage and we reset the boolean of whether they blocked the attack or not
			player.playerBlockedAttack = false
		monster.get_node("monsterSpriteRun").flip_h = false
		monsterAnimationPlayer.play_backwards(monster.getMonsterRun())
		monster.monsterAttacked = true
	if anim_name == monster.getMonsterRun() and monster.monsterAttacked == false:
		yield(monsterAttackDelay(), "completed")
		monsterAnimationPlayer.play(monster.getMonsterAttack())

		blockButton.visible = false
		monsterDelayTimer = null
		if blockButtonPressed == true:
			blockButtonPressed = false
			PlayerAnimationPlayer.play(player.getBlockAnimation())
			player.playerBlockedAttack = true
		else:
			PlayerAnimationPlayer.play(player.getHurtAnimation())
			player.playerBlockedAttack = false
		PlayerAnimationPlayer.queue(player.getIdleAnimation())
	elif anim_name == monster.getMonsterRun() and monster.monsterAttacked == true:
		monster.get_node("monsterSpriteRun").flip_h = true
		monster.monsterAttacked = false
		attackButton.visible = true
		#blockButton.visible = false
		monsterAnimationPlayer.play(monster.getMonsterIdle())
		
		# sets all actions back to be clickable
		attackButton.disabled = false
		blockButton.disabled = false
		healthPotionButton.disabled = false
		manaPotionButton.disabled = false


func monsterAttackDelay():
	monsterDelayTimer = Timer.new()
	monsterDelayTimer.set_wait_time(1.4)
	monsterDelayTimer.set_one_shot(true)
	self.add_child(monsterDelayTimer)
	monsterDelayTimer.start()
	blockButton.visible = true
	yield(monsterDelayTimer, "timeout")



func _on_monsterSpriteDead_visibility_changed():
	if monster.monsterDead == false:
		#continueButton.visible = true
		monster.monsterDead = true
	else:
		#continueButton.visible = false
		monster.monsterDead = false
		
	attackButton.visible = false
	#blockButton.visible = false
	healthPotionButton.visible = false
	manaPotionButton.visible = false
	goldLabel.visible = false
	goldIcon.visible = false
	playerHealthLabel.visible = false


func _on_wallAnimationPlayer_animation_finished(anim_name):
	if anim_name == "movingWall":
		attackButton.visible = true
		#blockButton.visible = false
		healthPotionButton.visible = true
		manaPotionButton.visible = true
		goldLabel.visible = true
		goldIcon.visible = true
		playerHealthLabel.visible = true
		monster.get_node("monsterHealth").visible = true


func _on_blockButton_pressed():
	print("block pressed")
	blockButton.disabled = true
	blockButtonPressed = true
	monsterDelayTimer.stop()
	monsterDelayTimer.emit_signal("timeout")
	monsterDelayTimer = null
