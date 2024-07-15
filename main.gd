extends Node2D

const speed = 100
var direction = Vector2(1, 0)
var seconds_passed = 0
var timer_running = false
var default_time = 1500 #in mintutes = 25
var time = 0

#"Time = 1" -> 30sec 

var selected_time = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Control/Label.text = str(default_time)
	$CanvasLayer/Control/Label2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer_running:
		
		$CanvasLayer/Control/Label2.visible = false
		seconds_passed -= delta
		if seconds_passed <= 0:
			$AudioStreamPlayer2D.play()
			seconds_passed = 0
			
			
			$CanvasLayer/Control/Label2.visible = true
			if $AudioStreamPlayer2D.finished :
				timer_running = false
	$ParallaxBackground.scroll_offset += direction * speed * delta
	
	var minutes = int(seconds_passed) / 60
	var seconds = int(seconds_passed) % 60
	$CanvasLayer/Control/Label.set_text("%d:%02d" % [minutes, seconds])


func _on_plus_pressed():
	seconds_passed += 30


func _on_minus_pressed():
	if seconds_passed >= 30:
		seconds_passed -= 30
	else:
		seconds_passed = 0


func _on_button_pressed():
	timer_running = !timer_running
