package ar.edu.tp.runnable

import ar.edu.PantallaPrincipal.PantallaPrincipalWindow
import ar.edu.repositorios.RepositorioUsuarios
import ar.edu.usuarios.Usuario
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.applicationContext.ApplicationContext

class EventosApplication extends Application {
	new(EventosBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		ApplicationContext.instance.configureSingleton(typeof(Usuario), new RepositorioUsuarios)
		new EventosApplication(new EventosBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new PantallaPrincipalWindow(this)
	}

}
