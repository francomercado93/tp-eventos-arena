//package gestionLocaciones
//
//import ar.edu.eventos.Locacion
//import ar.edu.repositorios.RepositorioLocacion
//import ar.edu.servicios.Servicio
//import org.eclipse.xtend.lib.annotations.Accessors
//import org.uqbar.commons.applicationContext.ApplicationContext
//import org.uqbar.commons.model.annotations.Observable
//
//@Observable
//@Accessors
//class GestionarLocacion {
//	Locacion locacionSeleccionada
//  
//      
//     
//      def crearLocacion(Locacion unaLocacion) {
//
//		getRepoLocacion.create(unaLocacion)
//
//	}
//
//	def eliminarLocacion() {
//		getRepoLocacion.delete(locacionSeleccionada)
//	}
//
//	def actualizarLocacion() {
//		getRepoLocacion.update(locacionSeleccionada)
//		locacionSeleccionada.actualizarCoordenadas(locacionSeleccionada.coordenadaX,locacionSeleccionada.coordenadaY)
//		getRepoLocacion.lista.add(locacionSeleccionada)
//		getRepoLocacion.lista.remove(locacionSeleccionada)
//		
//	}
//
//	def updateMasivo() {}
//
//	def RepositorioLocacion getRepoLocacion() {
//		ApplicationContext.instance.getSingleton(typeof(Locacion))
//	}
//}