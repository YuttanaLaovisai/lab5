extends Node

@export var mob_scene: PackedScene

func _ready():
	$ui/retry.hide()


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()

	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.progress_ratio = randf()

	var player_position = $player.position
	mob.initialize(mob_spawn_location.position, player_position)

	add_child(mob)

	mob.squashed.connect($ui/Label._on_mob_squashed.bind())

func _on_player_hit():
	$MobTimer.stop()
	$ui/retry.show()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $ui/retry	.visible:
		# This restarts the current scene.
		get_tree().reload_current_scene()
