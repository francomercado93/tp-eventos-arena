package ar.edu.tp.runnable

import ar.edu.PantallaPrincipal.PantallaPrincipalWindow
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class EventosApplication extends Application {
	new(EventosBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new EventosApplication(new EventosBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new PantallaPrincipalWindow(this)
	}

}
