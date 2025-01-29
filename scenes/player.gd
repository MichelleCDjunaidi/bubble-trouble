extends CharacterBody2D


const speed = 300.0


func _on_area_2d_area_entered(area: Area2D) -> void:
	Globals.enemy_entered = true
