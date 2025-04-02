extends Control

var val = 0

func start_loading_bar(time: int ):
    self.visible = true
    $Timer.start(time / 11.0)
    val = 0    

func _on_timer_timeout() -> void:
    if val == 110:
        self.visible = false
        val = 0
        $Timer.stop()
    val += 10
    $TextureProgressBar.value = val