extends Button

onready var player = get_node("/root/Player")

onready var playerAnimation = player.get_node("PlayerAnimationPlayer")

onready var monster = get_node("../Monster")
onready var monsterAnimation = monster.get_node("MonsterAnimationPlayer")
onready var monsterHealthLabel = monster.get_node("monsterHealth")

onready var runningFinished = 0
onready var deadMonster = false


func _ready():
	player.connect("animationFinished", self, "player_animation_finished")


func _on_attackButton_pressed():
	playerAnimation.play(player.getRunAnimation())


func player_animation_finished(anim_name):
	if anim_name == player.getAttackAnimation():
		player.playerRun.flip_h = true
		playerAnimation.play_backwards(player.getRunAnimation())
		
		# change monster health
		var monsterHealth = int(monsterHealthLabel.text)
		monsterHealth -= player.getPlayerDamage()
		
		if monsterHealth <= 0:
			monsterHealthLabel.visible = false
			deadMonster = true
			monster.monsterDeadCount += 1
			monsterAnimation.play(monster.getMonsterDead())
		else:
			monsterHealthLabel.text = str(monsterHealth)
			monsterAnimation.play(monster.getMonsterIdle())
	
	if runningFinished == 0 and anim_name == player.getRunAnimation():
		runningFinished = 1
		playerAnimation.play(player.getAttackAnimation())
		if player.playerGender == "Female":
			monsterAnimation.play(monster.getMonsterHurt()+"Offset")
			monsterAnimation.queue(monster.getMonsterHurt()+"Offset")
		else:
			monsterAnimation.play(monster.getMonsterHurt())
			monsterAnimation.queue(monster.getMonsterHurt())
			monsterAnimation.queue(monster.getMonsterHurt())
	elif anim_name == player.getRunAnimation() and runningFinished == 1:
		player.playerRun.flip_h = false
		playerAnimation.play(player.getIdleAnimation())
		runningFinished = 0
