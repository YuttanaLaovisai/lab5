extends Node3D



func _process(delta: float) -> void:
	if not $"Mutant Dying/AnimationPlayer".is_playing():
		$"Mutant Dying/AnimationPlayer".play("mixamo_com")
	
	if not $Run/AnimationPlayer.is_playing():
		$Run/AnimationPlayer.play("mixamo_com")
	if not $Walking/AnimationPlayer.is_playing():
		$Walking/AnimationPlayer.play("mixamo_com")
