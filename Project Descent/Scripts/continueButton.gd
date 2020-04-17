extends Button

onready var player = get_node("/root/Player")
onready var playerAnimation = player.get_node("PlayerAnimationPlayer")

onready var monster = get_node("../Monster")
onready var monsterAnimation = monster.get_node("MonsterAnimationPlayer")

onready var goldLabel = get_node("../goldLabel")

#wall transformation
onready var wallBackground = get_node("../wallBackground")
onready var wallAnimationPlayer = get_node("../wallAnimationPlayer")
onready var platform1 = get_node("../platform")
onready var platform2 = get_node("../platform2")
onready var platform3 = get_node("../platform3")

onready var pos1 = platform1.position
onready var pos2 = platform2.position
onready var pos3 = platform3.position


func _ready():
	player.connect("animationFinished", self, "player_animation_finished")

func _on_continueButton_pressed():
	self.visible = false
	playerAnimation.play(player.getRunningOffscreenRightAnimation())


func player_animation_finished(anim_name):
	if anim_name == player.getRunningOffscreenRightAnimation():
		var goldAmount = int(goldLabel.text)
		goldAmount += 5
		goldLabel.text = str(goldAmount)
		monster.get_node("monsterSpriteDead").visible = false
		
		#moves the wall down
		var tween = get_node("../Tween") 
		var newWallPos = Vector2(wallBackground.position.x, wallBackground.position.y - 33)
		tween.interpolate_property(wallBackground, "position", wallBackground.position, newWallPos, 2.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT) 
		tween.start()
		wallAnimationPlayer.play("movingWall")
		# use cntrl + k to comment/uncomment
#		var animation = Animation.new()
#		animation.set_length(1)	
#		animation.add_track(Animation.TYPE_VALUE)
#		animation.track_set_path(0, "wallBackground:transform/pos")
#		animation.track_insert_key(0, 0, Vector2(0, 0))
#		animation.track_insert_key(0, 1, Vector2(20, 20))
#		wallAnimationPlayer.add_animation("movingWallDown", animation)
#		wallAnimationPlayer.play("movingWallDown")


func _on_wallAnimationPlayer_animation_finished(anim_name):
	if anim_name == "movingWall":
		platform1.position = pos1
		platform2.position = pos2
		platform3.position = pos3
		player.playerIdle.visible = true
		playerAnimation.play(player.getIdleAnimation())
		monster.setMonster()
		monsterAnimation.play(monster.getMonsterIdle())
