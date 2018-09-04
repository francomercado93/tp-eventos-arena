//package runnables
//
//import gestionLocaciones.GestionarLocacionWindow
//import org.uqbar.arena.Application
//import org.uqbar.arena.windows.Window
//
//class LocacionAplication extends Application {
//		
//		new(BootstrapLocacion bootstrap) {
//		super(bootstrap)
//	}
//
//	static def void main(String[] args) {
//		new LocacionAplication(new BootstrapLocacion).start()
//	}
//
//	override  Window<?> createMainWindow() {
//		return new GestionarLocacionWindow(this)
//	}
//}