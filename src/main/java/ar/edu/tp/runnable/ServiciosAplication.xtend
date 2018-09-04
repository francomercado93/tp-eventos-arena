package ar.edu.tp.runnable

import ar.edu.servicios.ui.GestionServiciosWindow
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class ServiciosAplication extends Application {
		new(EventosBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new ServiciosAplication(new EventosBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new GestionServiciosWindow(this)
	}
	
}