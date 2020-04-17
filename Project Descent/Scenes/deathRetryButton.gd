extends Button

onready var totalCount = 0

func _on_deathRetryButton_visibility_changed():
	if self.visible == true:
		totalCount += 1
		#if totalCount > 1:
			#self.theme.set_color("Font Color", Theme.Color, "Black")

