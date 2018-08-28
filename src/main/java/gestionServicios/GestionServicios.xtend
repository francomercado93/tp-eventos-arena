package gestionServicios

import ar.edu.repositorios.RepositorioServicios
import ar.edu.servicios.Servicio
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable

class GestionServicios {
	
	Servicio servicioSeleccionado
  
      
     
      def crearServicio(Servicio unServicio) {

		getRepoServicios.create(unServicio)

	}

	def eliminarServicio() {
		getRepoServicios.delete(servicioSeleccionado)
	}

	def actualizarServicio() {
		getRepoServicios.update(servicioSeleccionado)
		getRepoServicios.lista.add(servicioSeleccionado)
		getRepoServicios.lista.remove(servicioSeleccionado)
		
	}

	def updateMasivo() {}

	def RepositorioServicios getRepoServicios() {
		ApplicationContext.instance.getSingleton(typeof(Servicio))
	}
}