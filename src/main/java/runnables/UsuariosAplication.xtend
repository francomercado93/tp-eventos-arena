
package runnables

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import gestionUsuarios.GestionUsuariosWindow

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