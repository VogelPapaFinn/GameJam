class_name Clock_product extends Usable

var band : Clock_chain
var shell : Clock_shell
var pointer : Clock_pointer

func _init(_band: Clock_chain, _shell: Clock_shell, _pointer: Clock_pointer) -> void:
	band = _band
	shell = _shell
	pointer = _pointer
