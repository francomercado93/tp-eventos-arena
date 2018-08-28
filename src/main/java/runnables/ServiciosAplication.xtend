package runnables

import gestionServicios.GestionServiciosWindow
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class ServiciosAplication extends Application {
		new(BootrapServicios bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new ServiciosAplication(new BootrapServicios).start()
	}

	override protected Window<?> createMainWindow() {
		return new GestionServiciosWindow(this)
	}
	
}