class_name Minigame
extends CanvasLayer

signal on_dismiss

var current_pieces = 0

func _ready() -> void:
	get_tree().paused = true
	%Exit.hide()
	
	for piece: PuzzlePiece in %Pieces.get_children():
		piece.on_correct_piece_dropped.connect(
			func():
				current_pieces += 1
				
				if (current_pieces == 5):
					%Exit.show()
					%Pieces.process_mode = Node.PROCESS_MODE_DISABLED
		)

func _on_button_pressed() -> void:
	get_tree().paused = false
	on_dismiss.emit()
	queue_free()
