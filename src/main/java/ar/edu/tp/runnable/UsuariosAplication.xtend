package ar.edu.tp.runnable

import ar.edu.usuarios.ui.GestionUsuariosWindow
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class UsuariosAplication extends Application {

	new(EventosBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new UsuariosAplication(new EventosBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new GestionUsuariosWindow(this)
	}

}
