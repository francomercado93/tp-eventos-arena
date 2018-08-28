package runnables

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import gestionUsuarios.GestionUsuariosWindow

class UsuariosAplication extends Application {

	new(BootstrapUsuarios bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new UsuariosAplication(new BootstrapUsuarios).start()
	}

	override protected Window<?> createMainWindow() {
		return new GestionUsuariosWindow(this)
	}

}
