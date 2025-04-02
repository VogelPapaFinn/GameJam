extends Node2D

func generate(s: Clock_shell, p: Clock_pointer, c: Clock_chain) -> Node2D:
    $shell.texture = s.get_sprite()
    $pointer.texture = p.get_sprite()
    $chain.texture = c.get_sprite()
    return self