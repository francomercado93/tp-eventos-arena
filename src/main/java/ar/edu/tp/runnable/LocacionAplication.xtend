package ar.edu.tp.runnable

import ar.edu.locaciones.ui.GestionarLocacionWindow
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class LocacionAplication extends Application {

	new(EventosBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new LocacionAplication(new EventosBootstrap).start()
	}

	override Window<?> createMainWindow() {
		return new GestionarLocacionWindow(this)
	}
}
