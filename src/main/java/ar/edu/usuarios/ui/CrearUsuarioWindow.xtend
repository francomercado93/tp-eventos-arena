package ar.edu.usuarios.ui

import ar.edu.usuarios.Usuario
import org.uqbar.arena.windows.WindowOwner

class CrearUsuarioWindow extends EditarUsuarioWindow {
	new(WindowOwner owner, Usuario model) {
		super(owner, model)
		title = "Creacion usuario"
	}
}
