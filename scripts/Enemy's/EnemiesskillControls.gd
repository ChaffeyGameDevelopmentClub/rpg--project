extends Node2D


onready var enemy = $".."
onready var timer = $EnemySkill/Timer
onready var yeild_timer = 0
var current_target 
export var HitTimer =.1
onready var animation_player = $"../AnimationPlayer"
func _ready():
	$EnemySkill/HeroBar2.max_value = enemy.Skill1_CoolDown
	timer.wait_time = enemy.Skill1_CoolDown
	timer.start()
	timer.connect("timeout",self,"On_timer1_out")
	
	
	

	
func On_timer1_out():
	if enemy.Alive:
		$EnemySkill/Message.text = "attacks"
		animation_player.play("attack")
		

func Attack():
	if  enemy.Alive:
		current_target.Take_damage(enemy.Attack)
		$EnemySkill/Message.text = "waiting"
func resetTimer():
	if  enemy.Alive: # Checks if the enemy isn't ataacking while dead
			#current_target.CurrentHealth -= enemy.Attack
			#$EnemySkill/Message.text = "waiting"
			timer.start()
			animation_player.play("slimesound")

func _on_skillControls_attack():
	pass
