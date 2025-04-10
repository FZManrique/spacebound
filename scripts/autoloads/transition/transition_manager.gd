extends CanvasLayer

signal on_transition_finished

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	color_rect.visible = false
	animation_player.animation_finished.connect(
		func(anim_name: String) -> void:
			if anim_name == "fade_to_black":
				on_transition_finished.emit()
				if DataManager.should_quit:
					return
				
				animation_player.play("fade_to_normal")
			elif anim_name == "fade_to_normal":
				print("Done transition")
				color_rect.visible = false
	)

func transition() -> void:
	color_rect.visible = true
	animation_player.play("fade_to_black")
